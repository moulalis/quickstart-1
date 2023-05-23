OVERVIEW
--------
An example of how to use REST-AT Annotation Example as individual micro services.

USAGE
--------------------

Prior to running the example make sure that the [REST-AT coordinator is deployed](../README.md#usage).

Once REST-AT coordinator is deployed build and run the annotation example application on port 8082,8083,8084 as it in configured in application.properties
    
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
    curl -X PUT --data txstatus=TransactionCommitted http://localhost:8080/rest-at-coordinator/tx/transaction-manager/0_ffff0a4cf0b6_-568c278f_6458bef8_7fb/terminator
    curl http://localhost:8080/rest-at-coordinator/tx/transaction-manager

WHAT JUST HAPPENED?
-------------------

1. We started REST-AT coordinator which is available to use in wildfly.

2. We verified REST-AT coordinator by invoking the transaction manager url.

3. Build and run the REST-AT application individually as shown, it starts all three microservice on different port i.e 8082,8083 and 8084.

4. Invoke book trip which start REST-AT and calls individual hotel and flight service.

5. The example performed an HTTP POST request and check that the transaction status code is 200.

6. The example performs commit operation if the status code is 200 in all the service.

7. The example performed rollback operation if the status code is not 200 in any of the service.

