    function sendTracking(elem, curr_user) {
    $.ajax({
        type: "POST",
        url: "/users/" + curr_user + "/trackings",
        data: {'tracking_id' : "", 'track' : $(elem).is(":checked")}
    });
}