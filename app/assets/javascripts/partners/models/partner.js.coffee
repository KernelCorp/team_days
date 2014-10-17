# for more details see: http://emberjs.com/guides/models/defining-models/

TeamDays.Partner = DS.Model.extend
  email:       DS.attr 'string'
  password:    DS.attr 'string'
  city_name:   DS.attr 'string'
  city_subdomain: DS.attr 'string'

