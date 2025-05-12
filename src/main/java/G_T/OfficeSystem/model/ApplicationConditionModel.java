package G_T.OfficeSystem.model;

import java.sql.Timestamp;

public class ApplicationConditionModel {
    private String applyStatus;
    private String applyId;
    private String userId;
    private String title;
    private String applyType;
    private String applyFile;
    private String noticeMatter;
    private Timestamp applyTime;
    private Timestamp approveTime;
    private int viewRow;
    private int currentPage;

    public ApplicationConditionModel () {
    }

    public ApplicationConditionModel (String applyStatus, String applyId, String userId, String title, String applyType,
            String applyFile, String noticeMatter, Timestamp applyTime, Timestamp approveTime, int viewRow,
            int currentPage) {
        this.applyStatus = applyStatus;
        this.applyId = applyId;
        this.userId = userId;
        this.title = title;
        this.applyType = applyType;
        this.applyFile = applyFile;
        this.noticeMatter = noticeMatter;
        this.applyTime = applyTime;
        this.approveTime = approveTime;
        this.viewRow = viewRow;
        this.currentPage = currentPage;
    }

    public String getApplyStatus () {
        return applyStatus;
    }

    public void setApplyStatus (String applyStatus) {
        this.applyStatus = applyStatus;
    }

    public String getApplyId () {
        return applyId;
    }

    public void setApplyId (String applyId) {
        this.applyId = applyId;
    }

    public String getUserId () {
        return userId;
    }

    public void setUserId (String userId) {
        this.userId = userId;
    }

    public String getTitle () {
        return title;
    }

    public void setTitle (String title) {
        this.title = title;
    }

    public String getApplyType () {
        return applyType;
    }

    public void setApplyType (String applyType) {
        this.applyType = applyType;
    }

    public String getApplyFile () {
        return applyFile;
    }

    public void setApplyFile (String applyFile) {
        this.applyFile = applyFile;
    }

    public String getNoticeMatter () {
        return noticeMatter;
    }

    public void setNoticeMatter (String noticeMatter) {
        this.noticeMatter = noticeMatter;
    }

    public Timestamp getApplyTime () {
        return applyTime;
    }

    public void setApplyTime (Timestamp applyTime) {
        this.applyTime = applyTime;
    }

    public Timestamp getApproveTime () {
        return approveTime;
    }

    public void setApproveTime (Timestamp approveTime) {
        this.approveTime = approveTime;
    }

    public int getViewRow () {
        return viewRow;
    }

    public void setViewRow (int viewRow) {
        this.viewRow = viewRow;
    }

    public int getCurrentPage () {
        return currentPage;
    }

    public void setCurrentPage (int currentPage) {
        this.currentPage = currentPage;
    }
}
