var ex = require('express');
var app = ex();
app.use(ex.static('.'));
app.listen(80);
