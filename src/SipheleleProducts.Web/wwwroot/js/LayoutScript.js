var researchStateStatus = $("#smcRecertificationStatusIds").val().split("|");

function GetResearchByUser(userEmail) {
    window.axios.get('/api/app/userInformation/checkUserCanAccessDefinedTopic?userEmail=' + userEmail)
    
        .then(function (response) {
            if (response.data.researchExists === true) {
                //$("#activeResearch").show();
                //$("#definedTopic").hide();
                $("#research").show();
            }
            else if (response.data.applicationExists === true && response.data.isResearchTopicDefinedByDepartment === true) {
                //$("#activeResearch").hide();
                //$("#definedTopic").show();
                $("#research").show();
            }
            else if (response.data.applicationExists === true &&
                response.data.isResearchTopicDefinedByDepartment !== true &&
                response.data.researchExists !== true) {
                $("#researchProposal").show();
                //$("#activeResearch").show();
                //$("#definedTopic").hide();
                $("#research").show();
            }
        });
}
function GetCheckIfTopicIsDefined() {
    let resuts = false;
    window.axios.get('/api/app/researchTopic/checkIfTopicIsDefined?email=@(User.Identity.Name)')
        .then(function (response) {
            resuts = response.data;
        });
    if (!resuts) {
        $('#activeResearch').hide();
        $('#definedTopic').show();

    }
}

function GetResearchStatusByResearchId(userEmail) {
    var researchStatus = null;
    window.axios.get('/api/app/userInformation/studentInformationByEmail?email=' + userEmail)
        .then((response) => {
            var qualificationId = response.data.qualification.studentQualificationId;

            window.axios.get('/api/app/research/researchIdByStudentQualificationId/' + qualificationId)
                .then((response) => {
                    researchStatus = response.data.statusId;

                });
        });

    return researchStatus;

}