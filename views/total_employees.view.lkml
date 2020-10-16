view: total_employees {
  derived_table: {
    sql: SELECT
          to_char(snapshot_date,'YYYY-MM') as month,
          count (distinct(id)) as total
          FROM dwh_bamboohr_employees_snapshot
          WHERE status = 'Active' AND job_title NOT IN ('Consultant', 'Non-Employee')
          Group by 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: month {
    type: string
    sql: ${TABLE}.month ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }

  set: detail {
    fields: [month, total]
  }
}
