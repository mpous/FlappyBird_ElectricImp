//based on the code extracted from --> http://forums.electricimp.com/discussion/1358/realtime-interaction-with-imp/p1

currentState <- null;

// when we get a request
http.onrequest(function(request, resp) {

    if (request.path == ".json") {
        // push the response onto the queue
        server.log(currentState);

        resp.header("Access-Control-Allow-Origin", "*");

        if (currentState > 0) resp.send(200, "1");
        else resp.send(200, "0");

        return;

    } else {
        resp.send(500, "ERROR");
    }

});

// when we get a "stateChanged" message from the device
device.on("stateChanged", function(data) {    
    currentState = data;
});
