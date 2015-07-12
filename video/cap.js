var ffmpeg = require('fluent-ffmpeg');

try{
ffmpeg().
    getAvailableFormats(function(err,formats){
        console.log('Available formats:');
	console.dir(formats);
    });
}
catch(err){
	console.log("error: " + err.message);
}
    

