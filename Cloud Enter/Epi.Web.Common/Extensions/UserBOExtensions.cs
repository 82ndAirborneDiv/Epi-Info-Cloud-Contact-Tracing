﻿using Epi.Cloud.Common.Constants;
using Epi.Web.Enter.Common.BusinessObject;
using Epi.Web.Enter.Common.DTO;

namespace Epi.Web.Enter.Common.Extensions
{
    public static class UserBOExtensions
    {
        public static UserDTO ToUserDTO(this UserBO result)
        {
            return new UserDTO()
            {
                UserId = result.UserId,
                UserName = result.UserName,
                FirstName = result.FirstName,
                LastName = result.LastName,
                PasswordHash = result.PasswordHash,
                PhoneNumber = result.PhoneNumber,
                ResetPassword = result.ResetPassword,
                Role = result.Role,
                UserHighestRole = result.UserHighestRole,
                Operation = Constant.OperationMode.NoChange,
                EmailAddress = result.EmailAddress,
                IsActive = result.IsActive,
                UGuid = result.UGuid
            };
        }
    }
}
