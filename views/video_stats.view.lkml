view: video_stats {
  sql_table_name: `apnews-dataplatform.video_engagement.jw_player_engagement_by_media` ;;

  dimension: date {
    sql: ${TABLE}.date ;;
    type:  date

  }
  dimension: platform {
    sql: ${TABLE}.platform ;;
  }
  dimension: media_id {
    primary_key: yes
    sql: ${TABLE}.media_id ;;

  }
  dimension: embeds {
    sql: ${TABLE}.embeds ;;
    type: number
  }
  dimension: plays {
    sql: ${TABLE}.plays ;;
    type: number
  }
  dimension: completes {
    sql: ${TABLE}.completes ;;
    type: number
  }
  dimension: ingested_at {
    sql: ${TABLE}.ingested_at ;;
    type: date_time
  }
  measure: total_embeds {
    type:  sum
    sql: ${embeds} ;;
  }
  measure: total_plays {
    type:  sum
    sql: ${plays} ;;
  }
  measure: total_completes {
    type:  sum
    sql: ${completes} ;;
  }
}
