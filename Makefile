#

.PHONY=certs
certs: test1 test2 test3 test4 test5 test6
	@echo "✅  done!"

# Normal cert, with SAN for domain
test1:  
	bin/createcert.sh cert test1.tls-o-matic.com tls-o-matic.com

# Cert with no SAN, bad CN
test2:  
	bin/createcert.sh nosan test2.tls-o-matic.null

# Cert with bad SAN
test3:  
	bin/createcert.sh cert test3.tls-o-matic.com test3.tls-o-matic.null

test4:
	bin/createcert.sh cert \*.tls-o-matic.com \*.test.tls-o-matic.com

test5:
	# Future certificate
	bin/createcert.sh future test5.tls-o-matic.com test5.tls-o-matic.com

test6:
	# Expired certificate
	bin/createcert.sh expired test6.tls-o-matic.com test6.tls-o-matic.com
