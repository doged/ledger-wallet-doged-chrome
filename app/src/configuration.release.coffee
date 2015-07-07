@ledger.env = "prod"
@ledger.isProd = ledger.env == "prod"
@ledger.isDev = ledger.env == "dev"

@ledger.config ?= {}
_.extend @ledger.config,
  m2fa:
    baseUrl: 'ws://darkchain.link/inv'
  restClient:
    baseUrl: 'http://darkchain.link/'
  syncRestClient:
    pullIntervalDelay: 60000
    pullThrottleDelay: 1000
    pushDebounceDelay: 1000
  enableLogging: no

@configureApplication = (app) ->
  _.extend @ledger.config,
    defaultLoggingLevel:
      Connected:
        Enabled: ledger.utils.Logger.Levels.ALL
        Disabled: ledger.utils.Logger.Levels.NONE
      Disconnected:
        Enabled: ledger.utils.Logger.Levels.ALL
        Disabled: ledger.utils.Logger.Levels.ALL
