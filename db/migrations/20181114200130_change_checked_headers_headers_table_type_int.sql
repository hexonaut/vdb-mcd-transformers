-- +goose Up
ALTER TABLE checked_headers
  ALTER bite_checked SET DEFAULT null,
  ALTER cat_file_chop_lump_checked SET DEFAULT null,
  ALTER cat_file_flip_checked SET DEFAULT null,
  ALTER cat_file_vow_checked SET DEFAULT null,
  ALTER deal_checked SET DEFAULT null,
  ALTER dent_checked SET DEFAULT null,
  ALTER flap_kick_checked SET DEFAULT null,
  ALTER flip_kick_checked SET DEFAULT null,
  ALTER flop_kick_checked SET DEFAULT null,
  ALTER jug_drip_checked SET DEFAULT null,
  ALTER jug_file_base_checked SET DEFAULT null,
  ALTER jug_file_ilk_checked SET DEFAULT null,
  ALTER jug_file_vow_checked SET DEFAULT null,
  ALTER pip_log_value_checked SET DEFAULT null,
  ALTER tend_checked SET DEFAULT null,
  ALTER vat_file_debt_ceiling_checked SET DEFAULT null,
  ALTER vat_file_ilk_checked SET DEFAULT null,
  ALTER vat_flux_checked SET DEFAULT null,
  ALTER vat_fold_checked SET DEFAULT null,
  ALTER vat_frob_checked SET DEFAULT null,
  ALTER vat_grab_checked SET DEFAULT null,
  ALTER vat_heal_checked SET DEFAULT null,
  ALTER vat_init_checked SET DEFAULT null,
  ALTER vat_move_checked SET DEFAULT null,
  ALTER vat_slip_checked SET DEFAULT null,
  ALTER vow_flog_checked SET DEFAULT null;

ALTER TABLE checked_headers
  ALTER COLUMN pip_log_value_checked TYPE integer USING CASE WHEN false
  THEN 0
                                                        ELSE 1 END,
  ALTER pip_log_value_checked SET DEFAULT 0,
  ALTER COLUMN flip_kick_checked TYPE integer USING CASE WHEN false
  THEN 0
                                                    ELSE 1 END,
  ALTER flip_kick_checked SET DEFAULT 0,
  ALTER COLUMN vat_frob_checked TYPE integer USING CASE WHEN false
  THEN 0
                                                   ELSE 1 END,
  ALTER vat_frob_checked SET DEFAULT 0,
  ALTER COLUMN tend_checked TYPE integer USING CASE WHEN false
  THEN 0
                                               ELSE 1 END,
  ALTER tend_checked SET DEFAULT 0,
  ALTER COLUMN bite_checked TYPE integer USING CASE WHEN false
  THEN 0
                                               ELSE 1 END,
  ALTER bite_checked SET DEFAULT 0,
  ALTER COLUMN dent_checked TYPE integer USING CASE WHEN false
  THEN 0
                                               ELSE 1 END,
  ALTER dent_checked SET DEFAULT 0,
  ALTER COLUMN vat_file_debt_ceiling_checked TYPE integer USING CASE WHEN false
  THEN 0
                                                                ELSE 1 END,
  ALTER vat_file_debt_ceiling_checked SET DEFAULT 0,
  ALTER COLUMN vat_file_ilk_checked TYPE integer USING CASE WHEN false
  THEN 0
                                                       ELSE 1 END,
  ALTER vat_file_ilk_checked SET DEFAULT 0,
  ALTER COLUMN vat_init_checked TYPE integer USING CASE WHEN false
  THEN 0
                                                   ELSE 1 END,
  ALTER vat_init_checked SET DEFAULT 0,
  ALTER COLUMN jug_file_ilk_checked TYPE integer USING CASE WHEN false
  THEN 0
                                                       ELSE 1 END,
  ALTER jug_file_ilk_checked SET DEFAULT 0,
  ALTER COLUMN jug_file_base_checked TYPE integer USING CASE WHEN false
  THEN 0
                                                        ELSE 1 END,
  ALTER jug_file_base_checked SET DEFAULT 0,
  ALTER COLUMN jug_file_vow_checked TYPE integer USING CASE WHEN false
  THEN 0
                                                       ELSE 1 END,
  ALTER jug_file_vow_checked SET DEFAULT 0,
  ALTER COLUMN deal_checked TYPE integer USING CASE WHEN false
  THEN 0
                                               ELSE 1 END,
  ALTER deal_checked SET DEFAULT 0,
  ALTER COLUMN jug_drip_checked TYPE integer USING CASE WHEN false
  THEN 0
                                                   ELSE 1 END,
  ALTER jug_drip_checked SET DEFAULT 0,
  ALTER COLUMN cat_file_chop_lump_checked TYPE integer USING CASE WHEN false
  THEN 0
                                                             ELSE 1 END,
  ALTER cat_file_chop_lump_checked SET DEFAULT 0,
  ALTER COLUMN cat_file_flip_checked TYPE integer USING CASE WHEN false
  THEN 0
                                                        ELSE 1 END,
  ALTER cat_file_flip_checked SET DEFAULT 0,
  ALTER COLUMN cat_file_vow_checked TYPE integer USING CASE WHEN false
  THEN 0
                                                       ELSE 1 END,
  ALTER cat_file_vow_checked SET DEFAULT 0,
  ALTER COLUMN flop_kick_checked TYPE integer USING CASE WHEN false
  THEN 0
                                                    ELSE 1 END,
  ALTER flop_kick_checked SET DEFAULT 0,
  ALTER COLUMN vat_move_checked TYPE integer USING CASE WHEN false
  THEN 0
                                                   ELSE 1 END,
  ALTER vat_move_checked SET DEFAULT 0,
  ALTER COLUMN vat_fold_checked TYPE integer USING CASE WHEN false
  THEN 0
                                                   ELSE 1 END,
  ALTER vat_fold_checked SET DEFAULT 0,
  ALTER COLUMN vat_heal_checked TYPE integer USING CASE WHEN false
  THEN 0
                                                   ELSE 1 END,
  ALTER vat_heal_checked SET DEFAULT 0,
  ALTER COLUMN vat_grab_checked TYPE integer USING CASE WHEN false
  THEN 0
                                                   ELSE 1 END,
  ALTER vat_grab_checked SET DEFAULT 0,
  ALTER COLUMN vat_flux_checked TYPE integer USING CASE WHEN false
  THEN 0
                                                   ELSE 1 END,
  ALTER vat_flux_checked SET DEFAULT 0,
  ALTER COLUMN vat_slip_checked TYPE integer USING CASE WHEN false
  THEN 0
                                                   ELSE 1 END,
  ALTER vat_slip_checked SET DEFAULT 0,
  ALTER COLUMN vow_flog_checked TYPE integer USING CASE WHEN false
  THEN 0
                                                   ELSE 1 END,
  ALTER vow_flog_checked SET DEFAULT 0,
  ALTER COLUMN flap_kick_checked TYPE integer USING CASE WHEN false
  THEN 0
                                                    ELSE 1 END,
  ALTER flap_kick_checked SET DEFAULT 0;

-- +goose Down
ALTER TABLE checked_headers
  ALTER pip_log_value_checked drop default,
  ALTER COLUMN pip_log_value_checked SET DATA TYPE boolean USING CASE WHEN pip_log_value_checked = 0
  THEN FALSE
                                                                 ELSE TRUE END,
  ALTER pip_log_value_checked SET DEFAULT FALSE,
  ALTER flip_kick_checked drop default,
  ALTER COLUMN flip_kick_checked SET DATA TYPE boolean USING CASE WHEN flip_kick_checked = 0
  THEN FALSE
                                                             ELSE TRUE END,
  ALTER flip_kick_checked SET DEFAULT FALSE,
  ALTER vat_frob_checked drop default,
  ALTER COLUMN vat_frob_checked SET DATA TYPE boolean USING CASE WHEN vat_frob_checked = 0
  THEN FALSE
                                                            ELSE TRUE END,
  ALTER vat_frob_checked SET DEFAULT FALSE,
  ALTER tend_checked drop default,
  ALTER COLUMN tend_checked SET DATA TYPE boolean USING CASE WHEN tend_checked = 0
  THEN FALSE
                                                        ELSE TRUE END,
  ALTER tend_checked SET DEFAULT FALSE,
  ALTER bite_checked drop default,
  ALTER COLUMN bite_checked SET DATA TYPE boolean USING CASE WHEN bite_checked = 0
  THEN FALSE
                                                        ELSE TRUE END,
  ALTER bite_checked SET DEFAULT FALSE,
  ALTER dent_checked drop default,
  ALTER COLUMN dent_checked SET DATA TYPE boolean USING CASE WHEN dent_checked = 0
  THEN FALSE
                                                        ELSE TRUE END,
  ALTER dent_checked SET DEFAULT FALSE,
  ALTER vat_file_debt_ceiling_checked drop default,
  ALTER COLUMN vat_file_debt_ceiling_checked SET DATA TYPE boolean USING CASE WHEN vat_file_debt_ceiling_checked = 0
  THEN FALSE
                                                                         ELSE TRUE END,
  ALTER vat_file_debt_ceiling_checked SET DEFAULT FALSE,
  ALTER vat_file_ilk_checked drop default,
  ALTER COLUMN vat_file_ilk_checked SET DATA TYPE boolean USING CASE WHEN vat_file_ilk_checked = 0
  THEN FALSE
                                                                ELSE TRUE END,
  ALTER vat_file_ilk_checked SET DEFAULT FALSE,
  ALTER vat_init_checked drop default,
  ALTER COLUMN vat_init_checked SET DATA TYPE boolean USING CASE WHEN vat_init_checked = 0
  THEN FALSE
                                                            ELSE TRUE END,
  ALTER vat_init_checked SET DEFAULT FALSE,
  ALTER jug_file_ilk_checked drop default,
  ALTER COLUMN jug_file_ilk_checked SET DATA TYPE boolean USING CASE WHEN jug_file_ilk_checked = 0
  THEN FALSE
                                                                ELSE TRUE END,
  ALTER jug_file_ilk_checked SET DEFAULT FALSE,
  ALTER jug_file_base_checked drop default,
  ALTER COLUMN jug_file_base_checked SET DATA TYPE boolean USING CASE WHEN jug_file_base_checked = 0
  THEN FALSE
                                                                 ELSE TRUE END,
  ALTER jug_file_base_checked SET DEFAULT FALSE,
  ALTER jug_file_vow_checked drop default,
  ALTER COLUMN jug_file_vow_checked SET DATA TYPE boolean USING CASE WHEN jug_file_vow_checked = 0
  THEN FALSE
                                                                ELSE TRUE END,
  ALTER jug_file_vow_checked SET DEFAULT FALSE,
  ALTER deal_checked drop default,
  ALTER COLUMN deal_checked SET DATA TYPE boolean USING CASE WHEN deal_checked = 0
  THEN FALSE
                                                        ELSE TRUE END,
  ALTER deal_checked SET DEFAULT FALSE,
  ALTER jug_drip_checked drop default,
  ALTER COLUMN jug_drip_checked SET DATA TYPE boolean USING CASE WHEN jug_drip_checked = 0
  THEN FALSE
                                                            ELSE TRUE END,
  ALTER jug_drip_checked SET DEFAULT FALSE,
  ALTER cat_file_chop_lump_checked drop default,
  ALTER COLUMN cat_file_chop_lump_checked SET DATA TYPE boolean USING CASE WHEN cat_file_chop_lump_checked = 0
  THEN FALSE
                                                                      ELSE TRUE END,
  ALTER cat_file_chop_lump_checked SET DEFAULT FALSE,
  ALTER cat_file_flip_checked drop default,
  ALTER COLUMN cat_file_flip_checked SET DATA TYPE boolean USING CASE WHEN cat_file_flip_checked = 0
  THEN FALSE
                                                                 ELSE TRUE END,
  ALTER cat_file_flip_checked SET DEFAULT FALSE,
  ALTER cat_file_vow_checked drop default,
  ALTER COLUMN cat_file_vow_checked SET DATA TYPE boolean USING CASE WHEN cat_file_vow_checked = 0
  THEN FALSE
                                                                ELSE TRUE END,
  ALTER cat_file_vow_checked SET DEFAULT FALSE,
  ALTER flop_kick_checked drop default,
  ALTER COLUMN flop_kick_checked SET DATA TYPE boolean USING CASE WHEN flop_kick_checked = 0
  THEN FALSE
                                                             ELSE TRUE END,
  ALTER flop_kick_checked SET DEFAULT FALSE,
  ALTER vat_move_checked drop default,
  ALTER COLUMN vat_move_checked SET DATA TYPE boolean USING CASE WHEN vat_move_checked = 0
  THEN FALSE
                                                            ELSE TRUE END,
  ALTER vat_move_checked SET DEFAULT FALSE,
  ALTER vat_fold_checked drop default,
  ALTER COLUMN vat_fold_checked SET DATA TYPE boolean USING CASE WHEN vat_fold_checked = 0
  THEN FALSE
                                                            ELSE TRUE END,
  ALTER vat_fold_checked SET DEFAULT FALSE,
  ALTER vat_heal_checked drop default,
  ALTER COLUMN vat_heal_checked SET DATA TYPE boolean USING CASE WHEN vat_heal_checked = 0
  THEN FALSE
                                                            ELSE TRUE END,
  ALTER vat_heal_checked SET DEFAULT FALSE,
  ALTER vat_grab_checked drop default,
  ALTER COLUMN vat_grab_checked SET DATA TYPE boolean USING CASE WHEN vat_grab_checked = 0
  THEN FALSE
                                                            ELSE TRUE END,
  ALTER vat_grab_checked SET DEFAULT FALSE,
  ALTER vat_flux_checked drop default,
  ALTER COLUMN vat_flux_checked SET DATA TYPE boolean USING CASE WHEN vat_flux_checked = 0
  THEN FALSE
                                                            ELSE TRUE END,
  ALTER vat_flux_checked SET DEFAULT FALSE,
  ALTER vat_slip_checked drop default,
  ALTER COLUMN vat_slip_checked SET DATA TYPE boolean USING CASE WHEN vat_slip_checked = 0
  THEN FALSE
                                                            ELSE TRUE END,
  ALTER vat_slip_checked SET DEFAULT FALSE,
  ALTER vow_flog_checked drop default,
  ALTER COLUMN vow_flog_checked SET DATA TYPE boolean USING CASE WHEN vow_flog_checked = 0
  THEN FALSE
                                                            ELSE TRUE END,
  ALTER vow_flog_checked SET DEFAULT FALSE,
  ALTER flap_kick_checked drop default,
  ALTER COLUMN flap_kick_checked SET DATA TYPE boolean USING CASE WHEN flap_kick_checked = 0
  THEN FALSE
                                                             ELSE TRUE END,
  ALTER flap_kick_checked SET DEFAULT FALSE;
