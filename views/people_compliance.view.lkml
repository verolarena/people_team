view: people_compliance {
  derived_table: {
    sql: SELECT * FROM google_sheets.people_compliance
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: _row {
    type: number
    sql: ${TABLE}._row ;;
  }

  dimension: anti_harassment_for_connecticut_residents_ {
    type: number
    sql: ${TABLE}.anti_harassment_for_connecticut_residents_ ;;
  }

  dimension: security_awareness_training {
    type: number
    sql: ${TABLE}.security_awareness_training ;;
  }

  dimension: anti_harassment_training {
    type: string
    sql: ${TABLE}.anti_harassment_training ;;
  }

  dimension: security_awareness_2020_onboarding {
    type: string
    sql: ${TABLE}.security_awareness_2020_onboarding ;;
  }

  dimension: anti_harassment_for_california_residents_ {
    type: string
    sql: ${TABLE}.anti_harassment_for_california_residents_ ;;
  }

  dimension: anti_harassment_for_managers_of_new_york_residents_ {
    type: number
    sql: ${TABLE}.anti_harassment_for_managers_of_new_york_residents_ ;;
  }

  dimension: employee_name {
    type: string
    sql: ${TABLE}.employee_name ;;
  }

  dimension: code_of_conduct {
    type: string
    sql: ${TABLE}.code_of_conduct ;;
  }

  dimension: anti_harassment_for_managers_of_california_residents_ {
    type: number
    sql: ${TABLE}.anti_harassment_for_managers_of_california_residents_ ;;
  }

  dimension: security_policies {
    type: string
    sql: ${TABLE}.security_policies ;;
  }

  dimension: code_of_conduct_onboarding {
    type: string
    sql: ${TABLE}.code_of_conduct_onboarding ;;
  }

  dimension: anti_harassment_for_managers_ {
    type: string
    sql: ${TABLE}.anti_harassment_for_managers_ ;;
  }

  dimension: security_awareness_2020 {
    type: string
    sql: ${TABLE}.security_awareness_2020 ;;
  }

  dimension: anti_harassment_for_new_york_residents_ {
    type: string
    sql: ${TABLE}.anti_harassment_for_new_york_residents_ ;;
  }

  dimension: security_policies_onboarding {
    type: string
    sql: ${TABLE}.security_policies_onboarding ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    sql: ${TABLE}._fivetran_synced ;;
  }

  set: detail {
    fields: [
      _row,
      anti_harassment_for_connecticut_residents_,
      security_awareness_training,
      anti_harassment_training,
      security_awareness_2020_onboarding,
      anti_harassment_for_california_residents_,
      anti_harassment_for_managers_of_new_york_residents_,
      employee_name,
      code_of_conduct,
      anti_harassment_for_managers_of_california_residents_,
      security_policies,
      code_of_conduct_onboarding,
      anti_harassment_for_managers_,
      security_awareness_2020,
      anti_harassment_for_new_york_residents_,
      security_policies_onboarding,
      _fivetran_synced_time
    ]
  }
}
