package G_T.OfficeSystem.model;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class ApplicationInfoModelDAO extends JdbcDaoSupport {

    @Autowired
    public ApplicationInfoModelDAO (DataSource dataSource) {
        this.setDataSource (dataSource);
    }

    public List<ApplicationInfoModel> FindApplication (ApplicationConditionModel condition) {
        String sql = "select * from application_info where 1 = 1";

        if (condition != null) {
            if (condition.getApplyId () != null && !condition.getApplyId ().isEmpty ()) {
                sql += " AND APPLY_ID LIKE '%" + condition.getApplyId () + "%'";
            }
            if (condition.getApplyType () != null && !condition.getApplyType ().isEmpty ()) {
                sql += " AND APPLY_TYPE LIKE '%" + condition.getApplyType () + "%'";
            }
            if (condition.getTitle () != null && !condition.getTitle ().isEmpty ()) {
                sql += " AND TITLE LIKE '%" + condition.getTitle () + "%'";
            }
            if (condition.getApplyTime () != null) {
                sql += " AND APPLY_TIME = '" + condition.getApplyTime () + "'";
            }
            if (condition.getApproveTime () != null) {
                sql += " AND APPROVE_TIME = '" + condition.getApproveTime () + "'";
            }

            if (condition.getApplyFile () != null && !condition.getApplyFile ().isEmpty ()) {
                sql += " AND APPLY_FILE LIKE '%" + condition.getApplyFile () + "%'";
            }
            if (condition.getNoticeMatter () != null && !condition.getNoticeMatter ().isEmpty ()) {
                sql += " AND NOTICE_MATTER LIKE '%" + condition.getNoticeMatter () + "%'";
            }
            if (condition.getApplyStatus () != null && !condition.getApplyStatus ().isEmpty ()
                    && !condition.getApplyStatus ().equals ("5")) {
                sql += " AND APPLY_STATUS = '" + condition.getApplyStatus () + "'";
            }
        }

        ApplicationInfoModelMapper mapper = new ApplicationInfoModelMapper ();
        try {
            List<ApplicationInfoModel> list = this.getJdbcTemplate ().query (sql, mapper);
            return list;
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }
}
