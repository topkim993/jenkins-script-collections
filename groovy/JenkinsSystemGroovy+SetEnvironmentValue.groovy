import hudson.model.*

def setEnvironmentVariable(key, value) {
    def build = Thread.currentThread().executable
    def params = new ParametersAction([
    new StringParameterValue(key, value)
    ])
    build.addAction(params)
}