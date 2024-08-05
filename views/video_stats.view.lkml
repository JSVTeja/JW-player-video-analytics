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
    sql: ${TABLE}.media_id ;;
    primary_key: yes

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

  measure: aggregate_play_rate {
    type: number
    sql: CASE WHEN ${total_plays} > 0 THEN ${total_completes} / ${total_plays} ELSE 0 END ;;
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
