WITH sends AS (

    SELECT
        id,
        user_id,
        sent_at,
        campaign_id,
        channel
    FROM campaign_sends

)
SELECT
    s.user_id,
    s.sent_at,
    s.campaign_id,
    s.channel,
    COUNT(DISTINCT e.id) AS engagements
FROM sends current_sends
LEFT JOIN sends previous_sends 
ON current_sends.user_id = previous_sends.user_id
AND previous.sent_at < current.sent_at
AND previous.sent_at >= current.sent_at - INTERVAL '7 days'

