const mongoose = require('mongoose');
const questionSchema = mongoose.Schema({
createdAt: String,
updatedAt:Date,
role: {
    type: String
},
question: {
    type: String
},
answer: {
    type: String
},
class: {
    type: String,
},
subject:{
    type: String
},
chapter:{
    type: String
},
topic: {
    type: String
},
reference_1:{
    type: String
},
reference_2:{
    type: String
},
reference_3:{
    type: String
},
reference_4:{
    type: String
},
option_1:{
    type: String
},
option_2:{
    type: String
},
option_3:{
    type: String
},
option_4:{
    type: String
}
});

const questionData = module.exports = mongoose.model('question',questionSchema);