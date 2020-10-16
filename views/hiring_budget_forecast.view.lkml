view: hiring_budget_forecast {
  derived_table: {
    sql: SELECT
        '2019-09' AS date, 556 AS budget, NULL AS forecast
      UNION ALL
      SELECT
        '2019-10' AS date, 571 AS budget, NULL AS forecast
      UNION ALL
      SELECT
        '2019-11' AS date, 586 AS budget, NULL AS forecast
      UNION ALL
      SELECT
        '2019-12' AS date, 598 AS budget, NULL AS forecast
      UNION ALL
      SELECT
        '2020-01' AS date, 626 AS budget, NULL AS forecast
      UNION ALL
      SELECT
        '2020-02' AS date, 675 AS budget, NULL AS forecast
      UNION ALL
      SELECT
        '2020-03' AS date, 706 AS budget, NULL AS forecast
      UNION ALL
      SELECT
        '2020-04' AS date, 738 AS budget, NULL AS forecast
      UNION ALL
      SELECT
        '2020-05' AS date, 739 AS budget, NULL AS forecast
      UNION ALL
      SELECT
        '2020-06' AS date, 749 AS budget, NULL AS forecast
      UNION ALL
      SELECT
        '2020-07' AS date, 749 AS budget, 681 AS forecast
      UNION ALL
      SELECT
        '2020-08' AS date, 749 AS budget, 721 AS forecast
      UNION ALL
      SELECT
        '2020-09' AS date, 749 AS budget, 772 AS forecast
      UNION ALL
      SELECT
        '2020-10' AS date, 749 AS budget, 818 AS forecast
      UNION ALL
      SELECT
        '2020-11' AS date, 749 AS budget, 835 AS forecast
      UNION ALL
      SELECT
        '2020-12' AS date, 749 AS budget, 836 AS forecast
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: budget {
    type: number
    sql: ${TABLE}.budget ;;
  }

  dimension: forecast {
    type: number
    sql: ${TABLE}.forecast ;;
  }

  set: detail {
    fields: [date, budget, forecast]
  }
}
