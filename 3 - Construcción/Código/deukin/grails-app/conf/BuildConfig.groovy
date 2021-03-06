grails.servlet.version = "2.5" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.target.level = 1.7
grails.project.source.level = 1.7
grails.project.war.file = "target/${appName}.war"

grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // specify dependency exclusions here; for example, uncomment this to disable ehcache:
        // excludes 'ehcache'
    }
    log "warn" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve

    repositories {
        inherits true // Whether to inherit repository definitions from plugins

        grailsPlugins()
        grailsHome()
        grailsCentral()

        mavenLocal()
        mavenCentral()

        // uncomment these (or add new ones) to enable remote dependency resolution from public Maven repositories
        mavenRepo "http://snapshots.repository.codehaus.org"
        mavenRepo "http://repository.codehaus.org"
        mavenRepo "http://download.java.net/maven/2/"
        mavenRepo "http://repository.jboss.com/maven2/"
		
		mavenRepo "http://repository.springsource.com/maven/bundles/release"
		mavenRepo "http://repository.springsource.com/maven/bundles/external"
		mavenRepo "http://repository.springsource.com/maven/libraries/release"
		mavenRepo "http://repository.springsource.com/maven/libraries/external"

    }
    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes eg.

//         runtime 'mysql:mysql-connector-java:5.1.20'
		runtime 'postgresql:postgresql:9.1-901.jdbc4'
//		runtime ":mysql-connectorj:5.1.20" 
//		compile ":quartz:1.0-RC13"
//		compile ":asynchronous-mail:1.0-RC6"
    }

    plugins {
        runtime ":hibernate:$grailsVersion"
        runtime ":jquery:1.8.0"
		runtime ":jquery-ui:1.8.7"
		runtime ":famfamfam:1.0"
        runtime ":resources:1.1.6"

        // Uncomment these (or add new ones) to enable additional resources capabilities
        runtime ":zipped-resources:1.0"
        runtime ":cached-resources:1.0"
        runtime ":yui-minify-resources:0.1.4"
		

        build ":tomcat:$grailsVersion"

        runtime ":database-migration:1.1"
		
		compile ":cache-headers:1.1.5"
        compile ':cache:1.1.1'
		compile ":mail:1.0.1"
		compile ":spring-security-core:1.2.7.1"
		compile ":richui:0.8"
		compile ":quartz:1.0-RC13"
		compile ":asynchronous-mail:1.0-RC6"
		compile ':webflow:2.0.8.1'
		compile ":rendering:0.4.4"
    }
}
