dataSource {
	pooled = true
	//    driverClassName = "org.h2.Driver"
	driverClassName = "org.postgresql.Driver"
	//	url = "jdbc:postgresql://localhost:5432/grails"
	//    username = "sa"
	//    password = ""
	//	dialect = "net.sf.hibernate.dialect.PostgreSQLDialect"
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
			dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
			//            url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
			url = 'jdbc:postgresql://localhost:5432/deukin_dev_db'
		}
	}
	test {
		dataSource {
			dbCreate = "create"
			//            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
			url = 'jdbc:postgresql://localhost:5432/deukin_test_db'
		}
	}
	production {
		dataSource {
			dbCreate = "create"
			//            url = "jdbc:h2:prodDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
			url = 'jdbc:postgresql://localhost:5432/deukin_prod_db'
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
