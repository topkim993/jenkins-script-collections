function sendWebexMessage() {
    DATA='{
            "roomId": "'${WEBEX_ROOM_ID}'",
            "markdown": "'$1'"
        }'
    echo "${DATA}"
    curl --location --request POST ${WEBEX_MESSAGE_ENDPOINT} \
        --header "Authorization: Bearer ${WEBEX_BOT_TOKEN}" \
        --header 'Content-Type: application/json' \
        --data-raw "${DATA}"
}