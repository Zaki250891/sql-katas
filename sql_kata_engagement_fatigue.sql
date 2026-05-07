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
FROM sends s

