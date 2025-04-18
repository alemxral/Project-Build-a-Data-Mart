/* ====================================================================
   airbnb_tests.sql  –  integrity checks for the Airbnb data mart
   ==================================================================== */
USE airbnb;

/*-----------------------------------------------------------------------
  1. Volume check – every table should report ≥ 20 rows
------------------------------------------------------------------------*/
SELECT 'user_profiles'          AS table_name, COUNT(*) AS row_count FROM user_profiles
UNION ALL SELECT 'hosts'               , COUNT(*) FROM hosts
UNION ALL SELECT 'guests'              , COUNT(*) FROM guests
UNION ALL SELECT 'admin_users'         , COUNT(*) FROM admin_users
UNION ALL SELECT 'property_listings'   , COUNT(*) FROM property_listings
UNION ALL SELECT 'reservations'        , COUNT(*) FROM reservations
UNION ALL SELECT 'property_reviews'    , COUNT(*) FROM property_reviews
UNION ALL SELECT 'host_reviews'        , COUNT(*) FROM host_reviews
UNION ALL SELECT 'property_images'     , COUNT(*) FROM property_images
UNION ALL SELECT 'amenities'           , COUNT(*) FROM amenities
UNION ALL SELECT 'listing_amenities'   , COUNT(*) FROM listing_amenities
UNION ALL SELECT 'calendar_availability', COUNT(*) FROM calendar_availability
UNION ALL SELECT 'pricing_history'     , COUNT(*) FROM pricing_history
UNION ALL SELECT 'transactions'        , COUNT(*) FROM transactions
UNION ALL SELECT 'messages'            , COUNT(*) FROM messages
UNION ALL SELECT 'property_rules'      , COUNT(*) FROM property_rules
UNION ALL SELECT 'cancellation_policies', COUNT(*) FROM cancellation_policies
UNION ALL SELECT 'support_tickets'     , COUNT(*) FROM support_tickets
UNION ALL SELECT 'user_activity_logs'  , COUNT(*) FROM user_activity_logs
UNION ALL SELECT 'referral_programs'   , COUNT(*) FROM referral_programs
UNION ALL SELECT 'dispute_resolution'  , COUNT(*) FROM dispute_resolution
UNION ALL SELECT 'referral_rewards'    , COUNT(*) FROM referral_rewards;

/*-----------------------------------------------------------------------
  2. Positive join test – booking → guest name → property → payment
------------------------------------------------------------------------*/
SELECT r.reservation_id,
       CONCAT(up.first_name,' ',up.last_name) AS guest,
       p.title                                AS property,
       t.amount                               AS paid
FROM   reservations      AS r
JOIN   guests            AS g   ON g.guest_id       = r.guest_id
JOIN   user_profiles     AS up  ON up.user_id       = g.user_id
JOIN   property_listings AS p   ON p.property_id    = r.property_id
JOIN   transactions      AS t   ON t.reservation_id = r.reservation_id
LIMIT  5;

/*-----------------------------------------------------------------------
  3. Ternary join test – dispute_resolution links its three parents
------------------------------------------------------------------------*/
SELECT dr.resolution_id,
       st.subject              AS ticket_subject,
       au.admin_level,
       res.check_in
FROM   dispute_resolution AS dr
JOIN   support_tickets     AS st  ON st.ticket_id       = dr.ticket_id
JOIN   admin_users         AS au  ON au.admin_id        = dr.admin_id
JOIN   reservations        AS res ON res.reservation_id = dr.reservation_id
LIMIT  5;

/*-----------------------------------------------------------------------
  4a. Negative FK test – should raise ERROR 1452, then roll back
------------------------------------------------------------------------*/
START TRANSACTION;
INSERT INTO reservations
(reservation_id, property_id, guest_id,
 check_in, check_out, status, booked_at)
VALUES (9999, 1, 9999, '2025-12-01', '2025-12-05', 'pending', NOW());
ROLLBACK;

/*-----------------------------------------------------------------------
  4b. Negative CHECK test – rating outside 1‑5 should raise ERROR 3819
------------------------------------------------------------------------*/
START TRANSACTION;
INSERT INTO property_reviews
(review_id, property_id, guest_id, rating, comment, review_date)
VALUES (9999, 1, 1, 7,
        'this should fail – rating > 5', CURDATE());
ROLLBACK;
