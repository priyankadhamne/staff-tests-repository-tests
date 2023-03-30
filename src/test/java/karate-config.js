function fn() {
    var config = read('classpath:env-config.yml');
    config.staffUtils = karate.callSingle('classpath:com/schneider/staff/common/utils.feature');

    var buildName = config.staffUtils.getCurrentLaunch();
    config.browserstack.webDriverSession.capabilities.build = buildName;
    config.browserstack.webDriverSession.desiredCapabilities.build = buildName;

    karate.configure('driver', config.browserstack);
    var retryConfig = { count: 3, interval: 5000 };
    karate.configure('retry', retryConfig);
    karate.configure('logPrettyRequest', true);
    karate.configure('logPrettyResponse', true);
    karate.configure('report', { showLog: true, showAllSteps: false });
    return config;
}
