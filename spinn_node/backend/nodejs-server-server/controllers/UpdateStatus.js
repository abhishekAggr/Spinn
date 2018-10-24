'use strict';

var utils = require('../utils/writer.js');
var UpdateStatus = require('../service/UpdateStatusService');

module.exports.updateUser = function updateUser (req, res, next) {
  var body = req.swagger.params['body'].value;
  UpdateStatus.updateUser(body)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};
