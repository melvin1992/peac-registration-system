mongoose = require 'mongoose'
Schema = mongoose.Schema

TransactionSchema = new Schema
  userID:
    type: String
    required: true
  schoolID:
    type: String
    required: true
  eventID:
    type: String
    required: true
  eventType:
    type: String
    required: true
  registrationCode:
    type: String
    required: true
  participantsCount:
    type: Number
    required: true
  totalAmount:
    type: Number
    required: true
  date:
    type: Date
    default: Date.now
  status:
    type: String
    enum: ['pending','processing','paid','expired','declined']
    default: 'pending'

transactionModel = mongoose.model('Transactions', TransactionSchema)
module.exports = transactionModel
