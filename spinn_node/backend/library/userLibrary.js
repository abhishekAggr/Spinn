var twilio = require('twilio');
// twilio account id
const accId =  'ACeae74fb4d4619ce7d32c74a6d13d9826';
//twilio authentication token
const authToken = '232902a5e0fec9f7ff79fa1753b5c3ea';
//twilio phone number
const caller = '+1(323)433-5598';
//twilio client
const client = new twilio(accId,authToken);

exports.otp = function(){
    return (Math.floor(Math.random() * 1000) + 1000).toString();
}
exports.sendOtp = function(userId,otp) {
    var calling = '+917500131761';
    client.messages.create({
        body: otp,
        to: calling,  
        from: caller
    }).then(()=> {
        }).done();
};

 exports.validQuery = function(element) {
    let query = new Object();
    if(element.role!="")
        query.role = element.role;
    if(element.class!="")
        query.class = element.class;
    if(element.subject!="")
        query.subject = element.subject;
    if(element.chapter!="")
        query.chapter = element.chapter;
    if(element.topic!="")
        query.topic = element.topic;  
    console.log(query);
return query;
}