import jenkins.model.Jenkins

/// `Changes since last successful build` Required to install plugin
/// https://plugins.jenkins.io/changes-since-last-success/
def allChangeCommentsFromLastSuccessfulBuild() {
    def env = binding.build.environment
    def job = Jenkins.instance.getItem("${env.JOB_NAME}")
    def lastSuccessBuildNumber = job.lastSuccessfulBuild.number as int
    def currentBuildNumber = "${env.BUILD_ID}" as int
    def range = (lastSuccessBuildNumber + 1)..currentBuildNumber

    return range
        .collect { job.getBuildByNumber(it) }
        .collectMany { it.getChangeSets() }
        .collectMany { it.getLogs() }
        .collect { it.getComment() }
}

println allChangeCommentsFromLastSuccessfulBuild().join("")