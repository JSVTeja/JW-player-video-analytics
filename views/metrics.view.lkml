view: metrics {
  sql_table_name: `apnews-dataplatform.ga_ua_metrics.metrics_v3` ;;

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }
  dimension: metric {
    type: string
    sql: ${TABLE}.metric ;;
  }
  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }
  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
  measure: pageviews {
    type: sum
    sql: ${TABLE}.value ;;
    filters: [platform: "web", metric: "pageviews"]
    }
  measure: sessions {
    type: sum
    sql: ${TABLE}.value ;;
    filters: [metric: "sessions"]
  }
  measure: users_daily {
    type: sum
    sql: ${TABLE}.value ;;
    filters: [metric: "users_daily"]
  }
  measure: totalEvents {
    type: sum
    sql: ${TABLE}.value ;;
    filters: [metric: "toatlEvents"]
  }
  measure: screenviews{
    type: sum
    sql:  ${TABLE}.value ;;
    filters: [platform: "app", metric: "screenviews"]
  }
  measure: PV_session {
    type: number
    sql: ${pageviews}/NULLIF(${sessions},0) ;;
  }
  measure: SV_session {
    sql: ${screenviews}/NULLIF(${sessions},0);;
  }
  measure: PV_user {
    type: number
    sql: ${pageviews}/NULLIF(${users_daily},0);;
}
  measure: SV_user {
    type: number
    sql: ${screenviews}/NULLIF(${users_daily},0);;
}
}
