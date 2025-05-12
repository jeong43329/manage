package G_T.OfficeSystem.model;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.web.context.WebApplicationContext;

@Service
@Scope (value = WebApplicationContext.SCOPE_SESSION, proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ApplicationModel {
    private List<ApplicationInfoModel> allApplicationList;
    private List<ApplicationInfoModel> showApplicationList;
    private int showNumber;
    private int currentPage;
    private String sortOrder;
    private String sortColumn;

    public void GetPage3 (int showNumber, int currentPage) {
        if (showNumber == 0 || allApplicationList.size () <= showNumber) {
            showApplicationList = allApplicationList;
        } else {
            showApplicationList = IntStream.range (0, allApplicationList.size ())
                    .filter (index -> index >= (currentPage - 1) * showNumber && index < currentPage * showNumber)
                    .mapToObj (allApplicationList::get)

                    .collect (Collectors.toList ());
        }
        this.showNumber = showNumber;
        this.currentPage = currentPage;
    }

    public void SortAll (String sortColumn, String sortOrder) {
        Collections.sort (this.allApplicationList, new Comparator<ApplicationInfoModel> () {
            public int compare (ApplicationInfoModel a1, ApplicationInfoModel a2) {
                int invertFlag = -1;
                if (sortOrder == null || sortOrder.equals ("") || sortOrder.equals ("▲")) {
                    invertFlag = 1;
                }
                if (sortColumn == null) {
                    return invertFlag * 1;
                }
                switch (sortColumn) {
                    case "状態":
                        return invertFlag * a1.getApplyStatus ().compareTo (a2.getApplyStatus ());
                    case "申請ID":
                        return invertFlag * a1.getApplyId ().compareTo (a2.getApplyId ());
                    case "申請種類":
                        return invertFlag * a1.getApplyType ().compareTo (a2.getApplyType ());
                    case "タイトル":
                        return invertFlag * a1.getTitle ().compareTo (a2.getTitle ());
                    case "申請日":
                        return invertFlag * a1.getApplyTime ().compareTo (a2.getApplyTime ());
                    case "承認日":
                        return invertFlag * a1.getApproveTime ().compareTo (a2.getApproveTime ());
                    case "申請ファイル":
                        return invertFlag * a1.getApplyFile ().compareTo (a2.getApplyFile ());
                    case "通知事項":
                        return invertFlag * a1.getNoticeMatter ().compareTo (a2.getNoticeMatter ());
                    default:
                        return invertFlag * 1;
                }
            }
        });
        this.sortColumn = sortColumn;
        this.sortOrder = sortOrder;
        GetPage3 (showNumber, 1);
    }

    @Autowired
    private ApplicationInfoModelDAO applicationInfoModelDAO;

    public ApplicationModel () {
        showNumber = 10;
        currentPage = 1;
        sortOrder = "▲";
        sortColumn = "申請ID";
    }

    public List<ApplicationInfoModel> getAllApplicationList () {
        return allApplicationList;
    }

    public void setAllApplicationList (List<ApplicationInfoModel> allApplicationList) {
        this.allApplicationList = allApplicationList;
    }

    public void FindApplication (ApplicationConditionModel condition) {
        setAllApplicationList (applicationInfoModelDAO.FindApplication (condition));
        SortAll (sortColumn, sortOrder);
        GetPage3 (showNumber, currentPage);
    }

    public List<ApplicationInfoModel> getShowApplicationList () {
        return showApplicationList;
    }

    public void setShowApplicationList (List<ApplicationInfoModel> showApplicationList) {
        this.showApplicationList = showApplicationList;
    }

    public int getShowNumber () {
        return showNumber;
    }

    public void setShowNumber (int showNumber) {
        this.showNumber = showNumber;
    }

    public int getCurrentPage () {
        return currentPage;
    }

    public void setCurrentPage (int currentPage) {
        this.currentPage = currentPage;
    }

    public String getSortOrder () {
        return sortOrder;
    }

    public void setSortOrder (String sortOrder) {
        this.sortOrder = sortOrder;
    }

    public String getSortColumn () {
        return sortColumn;
    }

    public void setSortColumn (String sortColumn) {
        this.sortColumn = sortColumn;
    }

    public void Sort (String sortColumn, String sortOrder) {
        SortAll (sortColumn, sortOrder);
        GetPage3 (showNumber, 1);
    }
}