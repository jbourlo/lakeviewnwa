var ffmpeg = require('fluent-ffmpeg');
var express = require('express');
var app = express();
var video;
var lg = function(data)
{
console.log(data);
}
var logger = 
{
  error:lg,
  info:lg,
  warning:lg,
  debug:lg,
};
try{
video = ffmpeg({logger:logger}).
addInput('hw:2,0').    
inputFormat('alsa').
addInput('/dev/video0').
    inputFormat('v4l2').
    //inputFPS(29.97).
    //addInput('hw:2,0').
    //inputFormat('alsa').
    //audioCodec('libmp3lame').
    //audioBitrate('128k').
    //audioChannels(1).
    //audioQuality(0).
    //videoBitrate('1000k').
    videoCodec('mpeg4').
    audioCodec('aac').
    outputOptions(' -strict -2').
    output('test.mp4').
    size('640x480').
    on('warning', function(data){
        console.log("WARNING: " + data);
    }).
    on('info', function(data){
        console.log("INFO: " + data.message);
    }).
    on('codecData', function(data){
	    console.log('Input is ' + data.audio + ' audio with ' + data.video + ' video ');
    }).
    on('error', function(err){
        console.log('ERROR: ' + err.message);
    }).
    on('end', function(err){
        console.log('Processing Finished');
    });
}
catch(err){
	console.log(err.message);
	console.dir(err);
}

app.get('/start', function(req,res){
  video.run();
  res.send("<h1>video started</h1>");
});
app.get('/stop', function(req,res){
  video.kill('SIGSTOP');
  video.kill();
  res.send("<h1>video stopped</h1>");
});
app.listen(80);

