// defining express pre-requisities
var express = require('express');
var cors = require('cors');
var path = require('path'); 
var mongoose = require('mongoose');
var swaggerUi = require('swagger-ui-express');
var swaggerDoc = require('./swagger.json');
var userRoutes = require('./routes/user.routes');
var questionRoutes = require('./routes/question.route');
var paperRoutes = require('./routes/paper.route');
var app = express();
var router = express.Router();
//database url
const url = 'mongodb://localhost:27017/db';

//connecting database
mongoose.connect(url,{useNewUrlParser:true});

//upon connection
mongoose.connection.on('connected',()=>{
    console.log('connected');
});

//error
mongoose.connection.on('error',()=>{
    console.log('error');
});

//port number
var port = 3000;

//middlewares
app.use(cors());
app.use(express.json());
app.use('/api',userRoutes);
app.use('/api',questionRoutes);
app.use('/api',paperRoutes);
app.use('/',swaggerUi.serve);
app.get('/',swaggerUi.setup(swaggerDoc));
//listening
app.listen(port,()=>{
    console.log(`server running at ${port}`);
})

