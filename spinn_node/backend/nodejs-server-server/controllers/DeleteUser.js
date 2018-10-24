'use strict';

var utils = require('../utils/writer.js');
var DeleteUser = require('../service/DeleteUserService');

module.exports.deleteUser = function deleteUser (req, res, next) {
  var username = req.swagger.params['username'].value;
  DeleteUser.deleteUser(username)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};
