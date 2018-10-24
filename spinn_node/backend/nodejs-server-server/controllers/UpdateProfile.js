'use strict';

var utils = require('../utils/writer.js');
var UpdateProfile = require('../service/UpdateProfileService');

module.exports.updateProfile = function updateProfile (req, res, next) {
  var body = req.swagger.params['body'].value;
  UpdateProfile.updateProfile(body)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};
