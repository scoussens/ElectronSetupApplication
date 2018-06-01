USE [%CMPDB%]
DECLARE @NewDeploySW_AreaID int
DECLARE @NewDeploySWFull_AreaID int
DECLARE @NewDeploySWQuick_AreaID int
SET @NewDeploySW_AreaID = (SELECT ID FROM PageArea WHERE Area = 'NewDeploySW') 
SET @NewDeploySWFull_AreaID = (SELECT ID FROM PageArea WHERE Area = 'NewDeploySWFull') 
SET @NewDeploySWQuick_AreaID = (SELECT ID FROM PageArea WHERE Area = 'NewDeploySWQuick') 

DECLARE AREA_CURSOR Cursor
FOR
  SELECT FK_SecurityGroupID FROM PageAreaToSecurityGroup WHERE FK_PageAreaID = @NewDeploySW_AreaID
  OPEN AREA_CURSOR
  DECLARE @SecurityGroupID Int
  FETCH NEXT FROM AREA_CURSOR INTO @SecurityGroupID
  WHILE (@@FETCH_STATUS <> -1)
  BEGIN
    IF (@@FETCH_STATUS <> -2)
       --Check if assigned Standard or Quick Deployment rights
       IF NOT EXISTS (SELECT * FROM PageAreaToSecurityGroup WHERE FK_SecurityGroupID = @SecurityGroupID AND FK_PageAreaID = @NewDeploySWFull_AreaID)
       BEGIN
         IF NOT EXISTS (SELECT * FROM PageAreaToSecurityGroup WHERE FK_SecurityGroupID = @SecurityGroupID AND FK_PageAreaID = @NewDeploySWQuick_AreaID)
         BEGIN
           --Not set, so set Standard Deployment rights for this group
          INSERT INTO PageAreaToSecurityGroup (FK_PageAreaID, FK_SecurityGroupID) VALUES (@NewDeploySWFull_AreaID, @SecurityGroupID)
         DELETE FROM PageAreaToSecurityGroup WHERE FK_PageAreaID = @NewDeploySW_AreaID AND FK_SecurityGroupID = @SecurityGroupID
         END
       END
    FETCH NEXT FROM AREA_CURSOR INTO @SecurityGroupID
  END
CLOSE AREA_CURSOR
DEALLOCATE AREA_CURSOR
