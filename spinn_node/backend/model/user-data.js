const mongoose = require('mongoose');
const userSchema = mongoose.Schema({
createdAt: String,
updatedAt:Date,
userId: {
    type:String,
    required: true
},
password: {
    type: String,
    required: true
},
first_name: {
    type: String
},
last_name: {
    type: String
},
gender: {
    type: String
},
status: {
    type: Number
},
otp: {
    type: String
},
DOB: {
    type: String
},
profile_picture: {
    data: Buffer,
    type: String
},
Home_address: {
    Line_1:{
        type: String
    },
    Line_2:{
        type: String
    },
    zip:{
        type: String
    },
    city: {
        type: String
    },
    state: {
        type: String
    }
},
Office_address: {
    Line_1:{
        type: String
    },
    Line_2:{
        type: String
    },
    zip:{
        type: String
    },
    city: {
        type: String
    },
    state: {
        type: String
    }
},
skill_set: [{
    role: {
        type: String
    },
    class: {
        type: String
    },
    subject:{
        type: String
    },
    chapter: {
        type: String
    },
    topic:{
        type: String
    },
    stats:{
        attempted: {
            type: Number
        },
        correct: {
            type: Number
        }
    }
}],
questions: {
    correctQuestionId: [{
        questionId: {
            type: String
        },
        attemptTime: {
            type: Date
        },
        wrongAttempts: {
            type: Number
        }
    }],
    wrongQuestionId:[{
        questionId: {
            type: String
        },
        attemptTime: {
            type: Date
        },
        attemptNumber: {
            type: Number
        }
    }]
}
});

const userData = module.exports = mongoose.model('data',userSchema);