OVERVIEW
--------
An example of how to use REST-AT Annotation Example as an individual micro service.It's main purpose is to show how to use the [annotations](https://github.com/jbosstm/narayana/tree/main/rts/at/tx/src/main/java/org/jboss/jbossts/star/annotation).

USAGE
--------------------

Prior to running the example make sure that the [REST-AT coordinator is deployed](../README.md#usage).

Once REST-AT coordinator is deployed build and run the annotation example application to run on port 8082,8083,8084 as it in configured in application.properties
    
    cd <narayana-repo>/rts/at/annotation/flight-service
    mvn clean package -Dquarkus.package.type=uber-jar
    mvn quarkus:dev

    repeat the same step for hotel-service and trip-service
     
    This will start three micro service on three diffrent ports.

Book a trip within a transaction (see <narayana-repo>/rts/at/annotation/trip-service/io/narayana/sra/demo/api/TripController.java method bookTrip)
this starts a transaction and you can verify it is running using
curl http://localhost:8080/rest-at-coordinator/tx/transaction-manager

    curl -XPOST http://localhost:8082/trip/book?hotelName=Rex

EXPECTED OUTPUT
---------------
    SRA: 0_ffff0a4cf0b6_-568c278f_6458bef8_7fb: Updating hotel participant state to: TransactionPrepared

    SRA: 0_ffff0a4cf0b6_-568c278f_6458bef8_7fb: Updating trip participant state to: TransactionPrepared

    SRA: 0_ffff0a4cf0b6_-568c278f_6458bef8_7fb: Updating trip participant state to: TransactionCommitted

    SRA: 0_ffff0a4cf0b6_-568c278f_6458bef8_7fb: Updating hotel participant state to: TransactionCommitted


Example of how to manually test that the coordinator is working using curl


    curl -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8080/rest-at-coordinator/tx/transaction-manager
    curl http://localhost:8080/rest-at-coordinator/tx/transaction-manager
    curl -X PUT --data txstatus=TransactionCommitted http://localhost:8080/rest-at-coordinator/tx/transaction-manag er/0_ffff0a4cf0b6_-568c278f_6458bef8_7fb/terminator
    curl http://localhost:8080/rest-at-coordinator/tx/transaction-manager

WHAT JUST HAPPENED?
-------------------

1. We started REST-AT coordinator which is available to use in wildfly.

2. We verified REST-AT coordinator is running by invoking the transaction manager url.

3. Build and run the REST-AT annotation application individually as shown, it starts all three microservice on different port i.e 8082,8083 and 8084 which is configured in application.properties such as in [flight-service](flight-service/src/main/resources/application.properties), [hotel-service](hotel-service/src/main/resources/application.properties) and [trip-service](flight-service/src/main/resources/application.properties).

4. Invoke book trip which start REST-AT transactions and calls individual hotel and flight service.

5. The example performed an HTTP POST request, a two-phase aware participant is registered with the coordinator by POSTing on the enlisting resource. A successful POST will return HTTP code 200 (ok).

6. If the HTTP status code returned is 202 in  then [/prepare/{id}](https://github.com/jbosstm/narayana/blob/0e45bcb6d5277131801aa7343fcee81068f66d0f/rts/at/tx/src/main/java/org/jboss/jbossts/star/client/SRAParticipant.java#L98) is being called and update the status to TransactionPrepared along with id.

7. If the HTTP status code returned is 200 in all the service then [/commit/{id}](https://github.com/jbosstm/narayana/blob/0e45bcb6d5277131801aa7343fcee81068f66d0f/rts/at/tx/src/main/java/org/jboss/jbossts/star/client/SRAParticipant.java#L89) is being called and update the status to transactionCommited along with id.

8. If the HTTP status code returned is 403 in any of the service then [/rollback/{id}](https://github.com/jbosstm/narayana/blob/0e45bcb6d5277131801aa7343fcee81068f66d0f/rts/at/tx/src/main/java/org/jboss/jbossts/star/client/SRAParticipant.java#L106) is being called and update the status to TransactionRolledBack along with id.

