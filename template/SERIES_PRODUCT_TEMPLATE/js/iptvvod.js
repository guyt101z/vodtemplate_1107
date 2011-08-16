// Lock Trick Play Key
//var trickplayLockedTime = 5000;
//var unlockTrickplayKey = true;

var vodTimer = new VODTimer();

var STATE_NORMAL = 0;
var STATE_SHOWINGSTOPMESSAGE = 1;
var STATE_SHOWINGPOWERMESSAGE = 2;
var STATE_END = 3;
var STATE_ERROR = 4;
var STATE_TIMELIMIT = 5;

var fastForwardSpeeds = [2, 4];
var rewindSpeeds = [2, 4];

//var volumeLevels = [0, 0.09, 0.16, 0.23, 0.30, 0.37, 0.44, 0.51, 0.58, 0.65, 0.72, 0.79, 0.86, 0.93, 1];
var volumeLevels = [0, 0.05, 0.10, 0.15, 0.20, 0.25, 0.30, 0.35, 0.40, 0.45, 0.50, 0.55, 0.60, 0.65, 0.70, 0.75, 0.80, 0.85, 0.90, 0.95, 1];

var iconDisappearTime = 5000;
var resumeFromStopTime = 5000;
var resumeFromPowerTime = 5000;
var muteTextDisappearTime = 2000;
var volumeTextDisappearTime = 2000;
var audioChannelTextDisappearTime = 2000;
var audioPIDTextDisappearTime = 2000;
var subtitlePIDTextDisappearTime = 2000;

var nullIconPath = "file:////gif/null.png";
var playIconPath = "file:////gif/Play_A1.png";
var pauseIconPath = "file:////gif/Pause_A1.png";
var fastForwardIconPath = "file:////gif/FFWD_A1.png";
var multipleFastForwardIconPath = "file:////gif/M-FF_A1.png";
var rewindIconPath = "file:////gif/REW_A1.png";
var multipleRewindIconPath = "file:////gif/M-REW_A1.png";
var nextChapterIconPath = "file:////gif/NEXT_A1.png";
var previousChapterIconPath = "file:////gif/PREV_A1.png";

var muteOnTextPath = "file:////gif/mute_on.png";
var muteOffTextPath = "file:////gif/mute_off.png";
var nullTextPath = "file:////gif/vol_null.gif";
var muteIconPath = "file:////gif/muteon_flag.png";
var noMuteIconPath = "file:////gif/null.png";
/*var volumeTextPaths = [
	"file:////gif/vol_0.png", "file:////gif/vol_9.png", "file:////gif/vol_16.png", "file:////gif/vol_23.png",
	"file:////gif/vol_30.png", "file:////gif/vol_37.png", "file:////gif/vol_44.png", "file:////gif/vol_51.png",
	"file:////gif/vol_58.png", "file:////gif/vol_65.png", "file:////gif/vol_72.png", "file:////gif/vol_79.png",
	"file:////gif/vol_86.png", "file:////gif/vol_93.png", "file:////gif/vol_100.png"
];
*/
var volumeTextPaths = [
	"file:////gif/vol_00.png", "file:////gif/vol_05.png", "file:////gif/vol_10.png", "file:////gif/vol_15.png", "file:////gif/vol_20.png",
	"file:////gif/vol_25.png", "file:////gif/vol_30.png", "file:////gif/vol_35.png", "file:////gif/vol_40.png", "file:////gif/vol_45.png",
	"file:////gif/vol_50.png", "file:////gif/vol_55.png", "file:////gif/vol_60.png", "file:////gif/vol_65.png", "file:////gif/vol_70.png",
	"file:////gif/vol_75.png", "file:////gif/vol_80.png", "file:////gif/vol_85.png", "file:////gif/vol_90.png", "file:////gif/vol_95.png", "file:////gif/vol_100.png"
];
var audioChannelLRTextPath = "file:////gif/audio_ab.png";
var audioChannelLLTextPath = "file:////gif/audio_a.png";
var audioChannelRRTextPath = "file:////gif/audio_b.png";
var audioChannelRLTextPath = "file:////gif/audio_ba.png";
var audioPIDTextPaths = [
	"file:////gif/audio_1.png", "file:////gif/audio_2.png", "file:////gif/audio_3.png", "file:////gif/audio_4.png",
	"file:////gif/audio_5.png", "file:////gif/audio_6.png", "file:////gif/audio_7.png", "file:////gif/audio_8.png"
];

var subtitlePIDTextPaths = [
        "file:////gif/SUBTITLE-1.png", "file:////gif/SUBTITLE-2.png", "file:////gif/SUBTITLE-3.png", "file:////gif/SUBTITLE-4.png"
];
var subtitleOffTextPath = "file:////gif/SUBTITLE-off.png";

var stopMessagePath = "file:////gif/message_stop.png";
var powerMessagePath = "file:////gif/message_power.png";
var endMessagePath = "file:////gif/message_end.png";
var timeLimitReachedMessagePath = "file:////gif/message_session.png";
//var stopMessageNextPath = "/jsp/cn/svod/common/images/message_stop_next.png";
var stopMessageNextPath = "/vodtemplate/template/MOVIETEMPLATE/images/message_stop_next.png";
//var endMessageNextPath = "/jsp/cn/svod/common/images/message_end_next.png";
var endMessageNextPath = "/vodtemplate/template/MOVIETEMPLATE/images/message_end_next.png";

var stbid = iptvGetSTBID();
var sid = iptvGetSTBSessionID();

var state = STATE_NORMAL;
var endState = STATE_NORMAL;

var isShowingIcon = false;
var hideIconTimeoutID = 0;

var isShowingText = false;
var hideTextTimeoutID = 0;

var resumeFromStopTimeoutID = 0;

var fastForwardSpeedIndex = -1;
var rewindSpeedIndex = -1;

var fastForwardBeginPosition = 0;
var prevTimeDisplay = "";

var audioPIDs;
var audioPIDIndex;
var audioChannel;
// Check every 0.5s for 20 times (10s max)
var audioPIDCheckInterval = 500;
var audioPIDCheckMaxTry = 20;
var audioPIDCheckCounter = 0;
var audioPIDCheckTimer;

var subtitlePIDs;
// for storing user selection of the last chapter with subtitles
var isShowingSubtitle = true;
var lastSubtitlePIDIndex = 0;
//
var lastChapter;
var setSubtitleDelayTime = 3000;
var nextEpisodeSelected = "N";

function keyHandler(key) {
	var vodStatus = iptvVODGetCurrentStatus();
	var volumeIndex = 0;

	if(key == KEY_PLAYPAUSE && unlockTrickplayKey == false) {
		if(state != STATE_NORMAL) return;
		if(state == STATE_END) return;
		if(state == STATE_TIMELIMITREACHED) return;

		if(vodStatus == VOD_PLAYING) {
			showPauseIcon();
			setState(STATE_NORMAL);

			iptvVODPause();
		} else {
			showPlayIcon();
			setState(STATE_NORMAL);
			iptvVODPlay();
			
			setChapter();
			// delay default subtitle setting time as function may return undefine at the beginning
			setTimeout("setSubtitle()", setSubtitleDelayTime);
			// switch the audio to the one defined by the user
			switchAudioPID();
			refreshFrontPanelTime();
		}
	} else if(key == KEY_FASTFORWARD && unlockTrickplayKey == false) {
		if(state != STATE_NORMAL) return;
		if(state == STATE_END) return;
		if(state == STATE_TIMELIMITREACHED) return;

		fastForwardSpeedIndex = vodStatus != VOD_FASTFORWARD ? 0 : ((fastForwardSpeedIndex + 1) % fastForwardSpeeds.length);
		showFastForwardIcon(fastForwardSpeedIndex);

		fastForwardBeginPosition = iptvVODGetCurrentPosition();
		iptvVODFastForward(fastForwardSpeeds[fastForwardSpeedIndex]);
		
		iptvVODHideSubtitle();
		
		setFrontPanelText("FFW");
		  //iptvAlert(iptvVODGetMaxFastForwardSpeed());
		 // iptvVODFastForward(iptvVODGetFastForwardSpeed());
	} else if(key == KEY_REWIND && unlockTrickplayKey == false) {
		if(state != STATE_NORMAL) return;
		if(state == STATE_END) return;
		if(state == STATE_TIMELIMITREACHED) return;

		rewindSpeedIndex = vodStatus != VOD_REWIND ? 0 : ((rewindSpeedIndex + 1) % rewindSpeeds.length);
		showRewindIcon(rewindSpeedIndex);

		iptvVODRewind(rewindSpeeds[rewindSpeedIndex]);
		
		iptvVODHideSubtitle();
		
		setFrontPanelText("REW");
		 //iptvVODRewind(iptvVODGetRewindSpeed());
	} else if(key == KEY_NEXTCHAPTER) {
		if(state != STATE_NORMAL) return;
		if(iptvVODGetCurrentChapter() >= iptvVODGetNoOfChapters() - 1) return;

		showNextChapterIcon();

		iptvVODPlayNextChapter();
	} else if(key == KEY_PREVIOUSCHAPTER) {
		if(state != STATE_NORMAL) return;
		if(iptvVODGetCurrentChapter() == 0) return;

		showPreviousChapterIcon();

		iptvVODPlayPreviousChapter();
	} else if(key == KEY_MUTE) {
		if(iptvVODGetIsMute()) {
			showMuteOffText();
			hideMuteIcon();

			iptvVODUnmute();
		} else {
			showMuteOnText();
			showMuteIcon();

			iptvVODMute();
		}
	} else if(key == KEY_VOLUMEUP) {
		if (iptvVODGetIsMute()) {
			showMuteOffText();
			hideMuteIcon();

			iptvVODUnmute();
		} else {
			volumeIndex = getVolumeIndex(iptvVODGetVolume());
			if (volumeIndex == volumeLevels.length - 1) {
				showVolumeText(volumeIndex);
			} else if(volumeIndex < volumeLevels.length - 1) {
				showVolumeText(volumeIndex + 1);
				iptvVODSetVolume(volumeLevels[volumeIndex + 1]);
			}
		}
	} else if(key == KEY_VOLUMEDOWN) {
		if (iptvVODGetIsMute()) {
			showMuteOffText();
			hideMuteIcon();

			iptvVODUnmute();
		} else {
			volumeIndex = getVolumeIndex(iptvVODGetVolume());
			if (volumeIndex == 0) {
				showVolumeText(volumeIndex);
			} else if(volumeIndex > 0) {
				showVolumeText(volumeIndex - 1);
				iptvVODSetVolume(volumeLevels[volumeIndex - 1]);
			}
		}
	} else if(key == KEY_AUDIO) {
		audioPIDs = iptvVODGetAudioPIDs();
		if(audioPIDs.length > 1) {
			audioPIDIndex = getNextAudioPIDIndex(audioPIDs, iptvVODGetAudioPID());
			iptvVODSetAudioPID(audioPIDs[audioPIDIndex]);
			showAudioPIDText(audioPIDIndex);
		} else {
			audioChannel = getNextAudioChannel(iptvVODGetAudioChannel());
			iptvVODSetAudioChannel(audioChannel);
			showAudioChannelText(iptvVODGetAudioChannel());
		}
	} else if(key == KEY_STOP) {
		if (state == STATE_END) return;
		if(state == STATE_TIMELIMITREACHED) return;
		if(next_productid != "" && next_productid != null) {
		showStopNextMessage();
		} else {
		showStopMessage();
		}
		setState(STATE_SHOWINGSTOPMESSAGE);

		iptvVODPause();
	} else if(key == KEY_POWER) {
		showPowerMessage();
		setState(STATE_SHOWINGPOWERMESSAGE);

		iptvVODPause();
	} else if(key == KEY_RED) {
		if (state == STATE_SHOWINGPOWERMESSAGE) {
			hideIcon();
			if (endState == STATE_END) {
				showEndMessage();
				setState(STATE_END);
			} else if (endState == STATE_TIMELIMITREACHED) {
				showTimeLimitReachedMessage();
				setState(STATE_TIMELIMITREACHED);
			} else {
				setState(STATE_NORMAL);
				iptvVODPlay();
				refreshFrontPanelText();
			}
		} else if(state == STATE_SHOWINGSTOPMESSAGE) {
			hideIcon();
			setState(STATE_NORMAL);
			iptvVODPlay();
			refreshFrontPanelTime();
		}
	} else if(key == KEY_GREEN) {
		if(state == STATE_SHOWINGSTOPMESSAGE) {
			iptvVODHideSubtitle();
			hideIcon();
			iptvVODStop();

			iptvEnableAllDefaultKeyHandlings();
			document.location.href = stopURL + "&stbid=" + stbid + "&sid=" + sid + "&nextEpisodeSelected=" + nextEpisodeSelected;
		} else if(state == STATE_SHOWINGPOWERMESSAGE) {
			iptvVODHideSubtitle();
			hideIcon();
			iptvVODStop();

			iptvEnableAllDefaultKeyHandlings();
			document.location.href = powerOffURL + "&stbid=" + stbid + "&sid=" + sid + "&nextEpisodeSelected=" + nextEpisodeSelected;
			iptvStandBy();
		}
	} else if(key == KEY_YELLOW) {
		if(next_productid != "" && next_productid != null) {
			if(state == STATE_SHOWINGSTOPMESSAGE) {
				iptvVODHideSubtitle();
				hideIcon();
				iptvVODStop();
				iptvEnableAllDefaultKeyHandlings();
				
				nextEpisodeSelected = "Y";
				iptvSetNonVolatileData('epis', parseInt(iptvGetNonVolatileData('epis'))+1);
				document.location.href = stopURL + "&stbid=" + stbid + "&sid=" + sid + "&nextEpisodeSelected=" + nextEpisodeSelected;
			} else if(state == STATE_END) {
				iptvEnableAllDefaultKeyHandlings();
				
				nextEpisodeSelected = "Y";
				iptvSetNonVolatileData('epis', parseInt(iptvGetNonVolatileData('epis'))+1);
				document.location.href = stopURL + "&stbid=" + stbid + "&sid=" + sid + "&nextEpisodeSelected=" + nextEpisodeSelected;
			}
		}
	} else if(key == KEY_ENTER) {
		if(state == STATE_END) {
			iptvEnableAllDefaultKeyHandlings();
			document.location.href = endURL + "&stbid=" + stbid + "&sid=" + sid;
		} else if(state == STATE_TIMELIMITREACHED) {
			iptvEnableAllDefaultKeyHandlings();
			document.location.href = timeLimitReachedURL + "&stbid=" + stbid + "&sid=" + sid;
		}
	} else if(key == KEY_SUBTITLE) {
		if(vodStatus == VOD_PLAYING) {
			subtitlePIDs = iptvGetSubtitlePIDs();
		
			if(subtitlePIDs.length == 0 || subtitlePIDs.length =undefined) return;
		
			if(!isShowingSubtitle) {
				iptvVODSetSubtitlePID(this.subtitlePIDs[0]);
				showSubtitlePIDText(0);
				iptvVODShowSubtitle();
				isShowingSubtitle = true;
				lastSubtitlePIDIndex = 0;
			} else {
				var i;
				for(i = 0; i < subtitlePIDs.length ; i++) {
					if(i == lastSubtitlePIDIndex) break;
				}

				if(i >= subtitlePIDs.length - 1) {
					iptvVODHideSubtitle();
					showSubtitleOffText();
					isShowingSubtitle = false;
				} else {
					lastSubtitlePIDIndex = getNextSubtitlePIDIndex(subtitlePIDs, iptvVODGetSubtitlePID());
					showSubtitlePIDText(lastSubtitlePIDIndex);

					iptvVODSetSubtitlePID(subtitlePIDs[lastSubtitlePIDIndex]);
					iptvVODShowSubtitle();
				}
			}
		}
	} 
}

function eventHandler(event) {
	var errorCode;

	if(event == VODEVENT_END) {
		iptvVODStop();
		if(next_productid != "" && next_productid != null){
		showEndNextMessage();
		} else {
		showEndMessage();
		}
		setState(STATE_END);
		iptvVODHideSubtitle();
		
	} else if(event == VODEVENT_ERROR) {
		errorCode = iptvVODGetErrorCode();
		iptvVODStop();

		iptvEnableAllDefaultKeyHandlings();
		document.location.href = errorURL + "?stbid=" + stbid + "&sid=" + sid + "&error_code=VOD_ENTONE_" + errorCode;
	} else if(event == VODEVENT_MAXPLAYTIMEPASSED) {
		iptvVODStop();
		showTimeLimitReachedMessage();
		setState(STATE_TIMELIMITREACHED);
	} else if(event == VODEVENT_FASTFORWARDTOEND) {
		iptvVODSeek(fastForwardBeginPosition);

		setChapter();
		// delay default subtitle setting time as function may return undefine at the beginning
		setTimeout("setSubtitle()", setSubtitleDelayTime);
		// switch the audio to the one defined by the user
		switchAudioPID();
		refreshFrontPanelTime();
	} else if(event == VODEVENT_REWINDTOBEGINNING) {
		iptvVODPlay();

		setChapter();
		// delay default subtitle setting time as function may return undefine at the beginning
		setTimeout("setSubtitle()", setSubtitleDelayTime);
		// switch the audio to the one defined by the user
		switchAudioPID();
		refreshFrontPanelTime();
	}
}

function setState(theState) {
	if (theState == STATE_END || theState == STATE_TIMELIMITREACHED) {
		endState = theState;
	}
	state = theState;
	fastForwardSpeedIndex = -1;
	rewindSpeedIndex = -1;
}

function showPauseIcon() {
	showIcon(pauseIconPath);
}

function showPlayIcon() {
	showIcon(playIconPath);

	hideIconTimeoutID = setTimeout("hideIcon()", iconDisappearTime);
}

function showFastForwardIcon(index) {
	showIcon(index == 0 ? fastForwardIconPath : multipleFastForwardIconPath);

	hideIconTimeoutID = setTimeout("hideIcon()", iconDisappearTime);
}

function showRewindIcon(index) {
	showIcon(index == 0 ? rewindIconPath : multipleRewindIconPath);

	hideIconTimeoutID = setTimeout("hideIcon()", iconDisappearTime);
}

function showNextChapterIcon() {
	showIcon(nextChapterIconPath);

	hideIconTimeoutID = setTimeout("hideIcon()", iconDisappearTime);
}

function showPreviousChapterIcon() {
	showIcon(previousChapterIconPath);

	hideIconTimeoutID = setTimeout("hideIcon()", iconDisappearTime);
}

function showIcon(path) {
	if(isShowingIcon) clearTimeout(hideIconTimeoutID);

	isShowingIcon = true;
	document.rightCornerText.src = path;
}

function hideIcon() {
	isShowingIcon = false;
	document.rightCornerText.src = nullIconPath;
}

function showStopMessage() {
	showIcon(stopMessagePath);

	resumeFromStopTimeoutID = setTimeout("resumeFromStop()", resumeFromStopTime);
}

function showPowerMessage() {
	showIcon(powerMessagePath);
	if (state != STATE_END && state != STATE_TIMELIMITREACHED && state != STATE_SHOWINGPOWERMESSAGE) {
		resumeFromStopTimeoutID = setTimeout("resumeFromStop()", resumeFromPowerTime);
	}
}

function showEndMessage() {
	showIcon(endMessagePath);
}

function showTimeLimitReachedMessage() {
	showIcon(timeLimitReachedMessagePath);
}

function showStopNextMessage() {
	showIcon(stopMessageNextPath);

	resumeFromStopTimeoutID = setTimeout("resumeFromStop()", resumeFromStopTime);
}

function showEndNextMessage() {
	showIcon(endMessageNextPath);
}

function resumeFromStop() {
	if(state != STATE_SHOWINGSTOPMESSAGE && state != STATE_SHOWINGPOWERMESSAGE) return;

	hideIcon();

	iptvVODPlay();
	setState(STATE_NORMAL);
	
	// delay default subtitle setting time as function may return undefine at the beginning
	setTimeout("setSubtitle()", setSubtitleDelayTime);
	// switch the audio to the one defined by the user
	switchAudioPID();
}

function showMuteOnText() {
	showText(muteOnTextPath);

	hideTextTimeoutID = setTimeout("hideText()", muteTextDisappearTime);
}

function showMuteOffText() {
	showText(muteOffTextPath);

	hideTextTimeoutID = setTimeout("hideText()", muteTextDisappearTime);
}

function showVolumeText(volumeIndex) {
	showText(volumeTextPaths[volumeIndex]);

	hideTextTimeoutID = setTimeout("hideText()", volumeTextDisappearTime);
}

function showAudioPIDText(audioPIDIndex) {
	showText(audioPIDTextPaths[audioPIDIndex]);

	hideTextTimeoutID = setTimeout("hideText()", audioPIDTextDisappearTime);
}

function showAudioChannelText(audioChannel) {
	if(audioChannel == VODAUDIOCHANNEL_LR) {
		showText(audioChannelLRTextPath);
	} else if(audioChannel == VODAUDIOCHANNEL_LL) {
		showText(audioChannelLLTextPath);
	} else if(audioChannel == VODAUDIOCHANNEL_RR) {
		showText(audioChannelRRTextPath);
	} else if(audioChannel == VODAUDIOCHANNEL_RL) {
		showText(audioChannelRLTextPath);
	}

	hideTextTimeoutID = setTimeout("hideText()", audioChannelTextDisappearTime);
}

function showText(path) {
	if(isShowingText) clearTimeout(hideTextTimeoutID);

	isShowingText = true;
	document.leftCornerText.src = path;
}

function hideText() {
	isShowingText = false;
	document.leftCornerText.src = nullTextPath;
}

function showMuteIcon() {
	document.muteImage.src = muteIconPath;
}

function hideMuteIcon() {
	document.muteImage.src = noMuteIconPath;
}

function getVolumeIndex(volume) {
	var i;

	for(i=0;i<volumeLevels.length;i++) {
		if(volumeLevels[i] == volume) return i;

		if(volumeLevels[i] > volume) {
			return volumeLevels[i] - volume < volume - volumeLevels[i - 1] ? i : i - 1;
		}
	}
}

function getNextAudioPIDIndex(audioPIDs, audioPID) {
	var i;
alert("getNextAudioPIDIndex(" + audioPIDs + "," + audioPID + ")");
	for(i=0;i<audioPIDs.length;i++) {
		if(audioPID == audioPIDs[i]) break;
	}

	return (i + 1) % audioPIDs.length;
}

function getNextAudioChannel(audioChannel) {
	if(audioChannel == VODAUDIOCHANNEL_LR) {
		return VODAUDIOCHANNEL_LL;
	} else if(audioChannel == VODAUDIOCHANNEL_LL) {
		return VODAUDIOCHANNEL_RR;
	} else if(audioChannel == VODAUDIOCHANNEL_RR) {
		return VODAUDIOCHANNEL_RL;
	} else if(audioChannel == VODAUDIOCHANNEL_RL) {
		return VODAUDIOCHANNEL_LR;
	}
}


// stop playing VOD
function stopPlay() {
	iptvVODStop();
	showTimeLimitReachedMessage();
	setState(STATE_TIMELIMITREACHED);
}

function initialize() {
	initMuteStatus();
	setTimeout("setDefaultAudio()",3000);

	// for Trick Play Key Lock
	setTimeout("trickplayKeyLocked()", trickplayLockedTime);

	if (isShowFrontPanel()) {
		//initialize display
		vodTimer.initialize();
		iptvShowFrontPanelText(vodTimer.getVODCurrentPlayTimeDisplay());
		prevTimeDisplay = vodTimer.getVODCurrentPlayTimeDisplay();
		setTimeout("refreshFrontPanel(true)", 10000);	// refresh front panel display for every 1 min
	}
	
	checkChapterJob();
}

function finalize() {
	setFrontPanelText(addLeadingZero(iptvGetCurrentChannel(), 3));
}

function isShowFrontPanel() {
	return showFrontPanelMsg(stbid);
}

function refreshFrontPanel(isSetTimeout) {
	var vodStatus = iptvVODGetCurrentStatus();
	vodTimer.updateVODCurrentPlayTime();

	if (vodTimer.isCurrentPlayTimeUpdate() && (!isSetTimeout || vodStatus == VOD_PLAYING)) {
		if (prevTimeDisplay != vodTimer.getVODCurrentPlayTimeDisplay()) {
			setFrontPanelText(vodTimer.getVODCurrentPlayTimeDisplay());
			prevTimeDisplay = vodTimer.getVODCurrentPlayTimeDisplay();
		}
	}
	if (isSetTimeout) {
		setTimeout("refreshFrontPanel(true)", 10000);
	}
}

function setFrontPanelText(s) {
	if (isShowFrontPanel()) {
		iptvShowFrontPanelText(s);
	}
}

// initialize mute status
function initMuteStatus() {
	if(iptvVODGetIsMute()) {
		showMuteIcon();
		iptvVODMute();
	}
}

// set default audio
function setDefaultAudio() {
	audioPIDs = iptvVODGetAudioPIDs();
	if(audioPIDs.length > 1) {
		iptvVODSetAudioPID(audioPIDs[0]);	// index 0 is default audio PID
	} else {
		iptvVODSetAudioChannel(VODAUDIOCHANNEL_LR);
	}
}

function setChapter() {
	lastChapter = iptvVODGetCurrentChapter();
}

function checkChapterJob() {
	checkChapter();
	setInterval("checkChapter()", 1000);
}

function checkChapter() {
	var vodStatus = iptvVODGetCurrentStatus();
	// only check chapter and subtitle when VOD is playing at its normal speed
	if (vodStatus == VOD_PLAYING) {
		var currentChapter = iptvVODGetCurrentChapter();
		if (lastChapter == undefine || lastChapter != currentChapter) {
			lastChapter = currentChapter;
			// delay default subtitle setting time as function may return undefine at the beginning
			setTimeout("setSubtitle()", setSubtitleDelayTime);
			// switch the audio to the one defined by the user
			switchAudioPID();
		}
	}
}

// set default subtitle
function setSubtitle() {
	subtitlePIDs = iptvGetSubtitlePIDs();
	if (subtitlePIDs.length > 0) {
		// subtitle is selected for last chapter with subtitles
		if (isShowingSubtitle) {
			// lastSubtitlePIDIndex is within subtitle list of this chapter
			if (lastSubtitlePIDIndex <= subtitlePIDs.length) {
				iptvVODSetSubtitlePID(subtitlePIDs[lastSubtitlePIDIndex]);
				showSubtitlePIDText(lastSubtitlePIDIndex);
				iptvVODShowSubtitle();
			} else {
				iptvVODSetSubtitlePID(subtitlePIDs[0]);
				showSubtitlePIDText(0);
				iptvVODShowSubtitle();
				lastSubtitlePIDIndex = 0;
			}
			// subtitle is not selected for last chapter with subtitles
		} else {
			iptvVODHideSubtitle();
			isShowingSubtitle = false;
		}
	}
}

function switchAudioPID() {
	// Check whether an existing timer is in place
	if (audioPIDCheckTimer != undefined) {
		clearTimeout(audioPIDCheckTimer);
		resetAudioPIDCheck();		
	}
	// Can add delay here for initial call
	setAudio();
}

function setAudio() {
	if (audioPIDs != undefined && audioPIDs.length > 1 && audioPIDIndex != undefined) {
		if (audioPIDIndex < audioPIDs.length) {
			var currentAudioPID = iptvVODGetAudioPID();
			// If current PID is not available or current playing audio is not the same as the stored one 
			if (currentAudioPID == undefined || currentAudioPID != audioPIDs[audioPIDIndex]) {
				iptvVODSetAudioPID(audioPIDs[audioPIDIndex]);
				audioPIDCheckCounter++;
				// Check whether it's less than the maximum # of tries
				if (audioPIDCheckCounter < audioPIDCheckMaxTry) {
					audioPIDCheckTimer = setTimeout("setAudio()", audioPIDCheckInterval);
				} else {
					resetAudioPIDCheck();
				}
			} else {
				// Current one is the same as the stored one
				showAudioPIDText(audioPIDIndex);
				resetAudioPIDCheck();
			}
		}
	}
}

function resetAudioPIDCheck() {
	audioPIDCheckCounter = 0;
	audioPIDCheckTimer = null;
}

// Trick Play Key Lock New Function
function trickplayKeyLocked() {
	unlockTrickplayKey = false;
}

function refreshFrontPanelTime() {
	vodTimer.updateVODCurrentPlayTime();

	setFrontPanelText(vodTimer.getVODCurrentPlayTimeDisplay());
	prevTimeDisplay = vodTimer.getVODCurrentPlayTimeDisplay();
}

function showSubtitlePIDText(subtitlePIDIndex) {
        showText(subtitlePIDTextPaths[subtitlePIDIndex]);
        hideTextTimeoutID = setTimeout("hideText()", subtitlePIDTextDisappearTime);
}

function showSubtitleOffText() {
        showText(subtitleOffTextPath);
        hideTextTimeoutID = setTimeout("hideText()", subtitlePIDTextDisappearTime);
}

function getNextSubtitlePIDIndex(subtitlePIDs, subtitlePID) {
        var i;
        for(i=0;i<subtitlePIDs.length;i++) {
                if(subtitlePID == subtitlePIDs[i]) break;
        }

        return (i + 1) % subtitlePIDs.length;
}
