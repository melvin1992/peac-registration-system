ShsSchools = require('mongoose').model 'ShsSchools'
_ = require 'lodash'

SHSService =
  create: (params) ->
    deferred = Promise.defer()

    _query =
      schoolId: params.schoolId

    @findAll _query
    .then (school) ->
      if _.isEmpty(school)
        shs = new ShsSchools params
        shs.save()
        .then (res) ->
          deferred.resolve res
        .catch (err) ->
          deferred.reject err
      else
        deferred.reject "School Id already exist."
    .catch (err) ->
      deferred.reject err

    deferred.promise

  findAll: (query) ->
    deferred = Promise.defer()
    ShsSchools.find query
    .then (res) ->
      deferred.resolve res
    .catch (err) ->
      deferred.reject err

    deferred.promise

  findOne: (id) ->
    deferred = Promise.defer()

    query = _id: id
    ShsSchools.findOne query
    .then (res) ->
      deferred.resolve res
    .catch (err) ->
      deferred.reject err

    deferred.promise

  updateSHS: (id, params) ->
    deferred = Promise.defer()

    query = _id: id
    ShsSchools.findOneAndUpdate query, params, new:true
    .then (res) ->
      deferred.resolve res
    .catch (err) ->
      deferred.reject err

    deferred.promise

  deleteSHS: (id) ->
    deferred = Promise.defer()

    query = _id: id
    ShsSchools.findOneAndRemove query
    .then (res) ->
      deferred.resolve res
    .catch (err) ->
      deferred.reject err

    deferred.promise

module.exports = SHSService
