module CheckApproverExtension
  def before_assignment(approver)
    raise UnauthorizedApproverException unless approver.authorized_approver
  end
end