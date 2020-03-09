using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Security;
using MoviePoster.InversionOfControl;

namespace MoviePoster.Models
{
    public class CustomRoleProvider : RoleProvider
    { 
        public override string[] GetRolesForUser(string username)
        {
            return new string[] { DependencyResolver.UserLogic.GetUserRole(username)};
        }

        public override bool IsUserInRole(string username, string roleName)
        {
            return GetRolesForUser(username)[0] == roleName;
        }

        #region NOT_IMPLEMENTED

        public override string ApplicationName { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }

        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override void CreateRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            throw new NotImplementedException();
        }

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            throw new NotImplementedException();
        }

        public override string[] GetAllRoles()
        {
            throw new NotImplementedException();
        }

        public override string[] GetUsersInRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override bool RoleExists(string roleName)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}