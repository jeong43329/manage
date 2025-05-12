package G_T.OfficeSystem.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import org.springframework.jdbc.core.RowMapper;

public class ApplicationInfoModelMapper implements RowMapper<ApplicationInfoModel> {

    public static final String BASE_SQL = "SELECT a.APPLY_ID, " + "a.APPLY_TYPE, " + "a.TITLE, " + "a.APPLY_TIME, "
            + "a.APPROVE_TIME, " + "a.APPLY_FILE, " + "a.NOTICE_MATTER, " + "a.APPLY_STATUS "
            + "FROM application_info a";

    @Override
    public ApplicationInfoModel mapRow (ResultSet rs, int rowNum) throws SQLException {
        String applyId = rs.getString ("APPLY_ID");
        String applyType = rs.getString ("APPLY_TYPE");
        String title = rs.getString ("TITLE");
        Timestamp applyTime = rs.getTimestamp ("APPLY_TIME");
        Timestamp approveTime = rs.getTimestamp ("APPROVE_TIME");
        String applyFile = rs.getString ("APPLY_FILE");
        String noticeMatter = rs.getString ("NOTICE_MATTER");
        String applyStatus = rs.getString ("APPLY_STATUS");

        return new ApplicationInfoModel (applyStatus, applyId, title, applyType, applyFile, noticeMatter, applyTime,
                approveTime);
    }
}
