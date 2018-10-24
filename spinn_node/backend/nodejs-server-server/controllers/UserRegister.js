'use strict';

var utils = require('../utils/writer.js');
var UserRegister = require('../service/UserRegisterService');

module.exports.registerUser = function registerUser (req, res, next) {
  var body = req.swagger.params['body'].value;
  UserRegister.registerUser(body)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};
