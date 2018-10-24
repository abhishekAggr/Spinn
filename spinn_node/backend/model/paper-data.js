const mongoose = require('mongoose');

const paperSchema = mongoose.Schema({
createdBy: {
    type: String
},
createdAt: {
    type: String
},
name: {
    type: String
},
skill_reference: {
    type: String
},
tags:[{
        type: String
}],
question:[]
});

const paperData = module.exports = mongoose.model('paper',paperSchema);