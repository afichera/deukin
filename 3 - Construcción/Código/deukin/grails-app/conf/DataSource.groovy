//dataSource {
//	pooled = true
//	//    driverClassName = "org.h2.Driver"
//	driverClassName = "org.postgresql.Driver"
//	//	url = "jdbc:postgresql://localhost:5432/grails"
//	//    username = "sa"
//	//    password = ""
//	//	dialect = "net.sf.hibernate.dialect.PostgreSQLDialect"
//	username = "postgres"
//	password = "postgres"
//}


dataSource {
	pooled = true
//	dbCreate = "update"
	dbCreate = "create-drop"
	driverClassName = "org.postgresql.Driver"
	username = "postgres"
	password = "postgres"
}
hibernate {
	cache.use_second_level_cache = true
	cache.use_query_cache = false
	cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
	development {
		dataSource {
			dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
			//            url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
			url = 'jdbc:postgresql://localhost:5432/deukin_dev'
//			url = "jdbc:mysql://localhost:3306/deukin_dev"
		}
	}
	test {
		dataSource {
			dbCreate = "update"
			//            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
//			url = "jdbc:mysql://localhost:3306/deukin_test"
			url = 'jdbc:postgresql://localhost:5432/deukin_test'
		}
	}
	production {
		dataSource {
			dbCreate = "update"
			//            url = "jdbc:h2:prodDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
//			url = 'jdbc:postgresql://localhost:5432/deukin_prod'
			url = "jdbc:mysql://localhost:3306/deukin_prod"
			pooled = true
			properties {
				maxActive = -1
				minEvictableIdleTimeMillis=1800000
				timeBetweenEvictionRunsMillis=1800000
				numTestsPerEvictionRun=3
				testOnBorrow=true
				testWhileIdle=true
				testOnReturn=true
				validationQuery="SELECT 1"
			}
		}
	}
}
