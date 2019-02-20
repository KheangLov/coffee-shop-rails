module APP
  NAME = "Coffee Shop"
  DASHBOARD = "Dashboard"
  BRANCHES = "Branches"
  STOCK_CATEGORIES = "Stock Categories"
  STOCKS = "Stocks"
  USERS = "Users"
  COMPANIES = "Companies"

  ROLE_SUPERADMIN = "superadmin"
  ROLE_ADMIN = "admin"
  ROLE_EDITOR = "editor"
  ROLE_USER = "user"

  MY = "my"
  ADMIN = "admin"

  MALE = "male"
  FEMALE = "female"
  OTHER = "other"

  PENDING = "pending"
  ACTIVE = "active"
  INACTIVE = "inactive"
  DELETED = 'deleted'
  BANNED = 'banned'

  GENDER = [{gender: OTHER},{gender: MALE}, {gender: FEMALE}]
  USER_STATUS = [{status: PENDING},{status: ACTIVE}, {status: INACTIVE}]

  STOCK_STATUS = [{status: ACTIVE}, {status: PENDING}, {status: INACTIVE}]
end
