/*
** Copyright 2025 Metaversal Corporation.
** 
** Licensed under the Apache License, Version 2.0 (the "License"), 
** you may not use this file except in compliance with the License. 
** You may obtain a copy of the License at 
** 
**    https://www.apache.org/licenses/LICENSE-2.0
** 
** Unless required by applicable law or agreed to in writing, software 
** distributed under the License is distributed on an "AS IS" BASIS, 
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
** See the License for the specific language governing permissions and 
** limitations under the License.
** 
** SPDX-License-Identifier: Apache-2.0
*/

/* ************************************************************************************************************************** */

-- Rename [{MSF_Map}] to your desired database name
-- This script creates a MySQL database with UTF-8 support and appropriate settings

-- Drop database (optional - remove if you want to preserve existing data)
-- DROP DATABASE [{MSF_Map}];

CREATE DATABASE IF NOT EXISTS MSF_Map;

USE MSF_Map;

/*
**
** MySQL Database Creation Notes:
**
** 1. File Management: MySQL handles data files automatically. No need to specify file paths.
** 2. Character Set: utf8mb4 is recommended for full UTF-8 support including emojis.
** 3. Storage Engine: InnoDB is recommended for ACID compliance and foreign key support.
** 4. User Management: Create dedicated users instead of using root for applications.
** 5. Configuration: Many SQL Server database settings are handled in MySQL's my.cnf file.
**
** Recommended my.cnf settings for this database:
** [mysqld]
** default-storage-engine=innodb
** innodb_file_per_table=1
** innodb_buffer_pool_size=1G  # Adjust based on available RAM
** max_connections=200
** query_cache_size=32M
** log-bin=mysql-bin
** binlog_format=ROW
**
*/

DROP FUNCTION IF EXISTS ArcLength;
DROP FUNCTION IF EXISTS DateTime2_Time;
DROP FUNCTION IF EXISTS Date_DateTime2;
DROP FUNCTION IF EXISTS Format_Bound;
DROP FUNCTION IF EXISTS Format_Control;
DROP FUNCTION IF EXISTS Format_Double;
DROP FUNCTION IF EXISTS Format_Double3;
DROP FUNCTION IF EXISTS Format_Double4;
DROP FUNCTION IF EXISTS Format_Float;
DROP FUNCTION IF EXISTS Format_Name_C;
DROP FUNCTION IF EXISTS Format_Name_P;
DROP FUNCTION IF EXISTS Format_Name_R;
DROP FUNCTION IF EXISTS Format_Name_T;
DROP FUNCTION IF EXISTS Format_ObjectHead;
DROP FUNCTION IF EXISTS Format_Orbit_Spin;
DROP FUNCTION IF EXISTS Format_Owner;
DROP FUNCTION IF EXISTS Format_Properties_C;
DROP FUNCTION IF EXISTS Format_Properties_T;
DROP FUNCTION IF EXISTS Format_Resource;
DROP FUNCTION IF EXISTS Format_Transform;
DROP FUNCTION IF EXISTS Format_Type_C;
DROP FUNCTION IF EXISTS Format_Type_P;
DROP FUNCTION IF EXISTS Format_Type_T;
DROP FUNCTION IF EXISTS IPstob;
DROP FUNCTION IF EXISTS IPbtos;
DROP FUNCTION IF EXISTS Time_Current;
DROP FUNCTION IF EXISTS Time_DateTime2;

DROP PROCEDURE IF EXISTS call_RMRoot_Event_Owner;
DROP PROCEDURE IF EXISTS call_Error  ;
DROP PROCEDURE IF EXISTS call_Event_Push;
DROP PROCEDURE IF EXISTS etl_Events  ;
DROP PROCEDURE IF EXISTS call_RMCObject_Event;
DROP PROCEDURE IF EXISTS call_RMCObject_Event_Bound;
DROP PROCEDURE IF EXISTS call_RMCObject_Event_Name;
DROP PROCEDURE IF EXISTS call_RMCObject_Event_Orbit_Spin;
DROP PROCEDURE IF EXISTS call_RMCObject_Event_Owner;
DROP PROCEDURE IF EXISTS call_RMCObject_Event_Properties;
DROP PROCEDURE IF EXISTS call_RMCObject_Event_Resource;
DROP PROCEDURE IF EXISTS call_RMCObject_Event_RMCObject_Close;
DROP PROCEDURE IF EXISTS call_RMCObject_Event_RMCObject_Open;
DROP PROCEDURE IF EXISTS call_RMCObject_Event_RMTObject_Close;
DROP PROCEDURE IF EXISTS call_RMCObject_Event_RMTObject_Open;
DROP PROCEDURE IF EXISTS call_RMCObject_Event_Transform;
DROP PROCEDURE IF EXISTS call_RMCObject_Event_Type;
DROP PROCEDURE IF EXISTS call_RMCObject_Log;
DROP PROCEDURE IF EXISTS call_RMCObject_Select;
DROP PROCEDURE IF EXISTS call_RMCObject_Validate;
DROP PROCEDURE IF EXISTS call_RMCObject_Validate_Bound;
DROP PROCEDURE IF EXISTS call_RMCObject_Validate_Name;
DROP PROCEDURE IF EXISTS call_RMCObject_Validate_Orbit_Spin;
DROP PROCEDURE IF EXISTS call_RMCObject_Validate_Owner;
DROP PROCEDURE IF EXISTS call_RMCObject_Validate_Properties;
DROP PROCEDURE IF EXISTS call_RMCObject_Validate_Resource;
DROP PROCEDURE IF EXISTS call_RMCObject_Validate_Transform;
DROP PROCEDURE IF EXISTS call_RMCObject_Validate_Type;
DROP PROCEDURE IF EXISTS get_RMCObject_Update;
DROP PROCEDURE IF EXISTS search_RMCObject;
DROP PROCEDURE IF EXISTS set_RMCObject_Bound;
DROP PROCEDURE IF EXISTS set_RMCObject_Name;
DROP PROCEDURE IF EXISTS set_RMCObject_Orbit_Spin;
DROP PROCEDURE IF EXISTS set_RMCObject_Owner;
DROP PROCEDURE IF EXISTS set_RMCObject_Properties;
DROP PROCEDURE IF EXISTS set_RMCObject_Resource;
DROP PROCEDURE IF EXISTS set_RMCObject_RMCObject_Close;
DROP PROCEDURE IF EXISTS set_RMCObject_RMCObject_Open;
DROP PROCEDURE IF EXISTS set_RMCObject_RMTObject_Close;
DROP PROCEDURE IF EXISTS set_RMCObject_RMTObject_Open;
DROP PROCEDURE IF EXISTS set_RMCObject_Transform;
DROP PROCEDURE IF EXISTS set_RMCObject_Type;
DROP PROCEDURE IF EXISTS call_RMPObject_Event;
DROP PROCEDURE IF EXISTS call_RMPObject_Event_Bound;
DROP PROCEDURE IF EXISTS call_RMPObject_Event_Name;
DROP PROCEDURE IF EXISTS call_RMPObject_Event_Owner;
DROP PROCEDURE IF EXISTS call_RMPObject_Event_Resource;
DROP PROCEDURE IF EXISTS call_RMPObject_Event_RMPObject_Close;
DROP PROCEDURE IF EXISTS call_RMPObject_Event_RMPObject_Open;
DROP PROCEDURE IF EXISTS call_RMPObject_Event_Transform;
DROP PROCEDURE IF EXISTS call_RMPObject_Event_Type;
DROP PROCEDURE IF EXISTS call_RMPObject_Log;
DROP PROCEDURE IF EXISTS call_RMPObject_Select;
DROP PROCEDURE IF EXISTS call_RMPObject_Validate;
DROP PROCEDURE IF EXISTS call_RMPObject_Validate_Bound;
DROP PROCEDURE IF EXISTS call_RMPObject_Validate_Name;
DROP PROCEDURE IF EXISTS call_RMPObject_Validate_Owner;
DROP PROCEDURE IF EXISTS call_RMPObject_Validate_Resource;
DROP PROCEDURE IF EXISTS call_RMPObject_Validate_Transform;
DROP PROCEDURE IF EXISTS call_RMPObject_Validate_Type;
DROP PROCEDURE IF EXISTS get_RMPObject_Update;
DROP PROCEDURE IF EXISTS set_RMPObject_Bound;
DROP PROCEDURE IF EXISTS set_RMPObject_Name;
DROP PROCEDURE IF EXISTS set_RMPObject_Owner;
DROP PROCEDURE IF EXISTS set_RMPObject_Parent;
DROP PROCEDURE IF EXISTS set_RMPObject_Resource;
DROP PROCEDURE IF EXISTS set_RMPObject_RMPObject_Close;
DROP PROCEDURE IF EXISTS set_RMPObject_RMPObject_Open;
DROP PROCEDURE IF EXISTS set_RMPObject_Transform;
DROP PROCEDURE IF EXISTS set_RMPObject_Type;
DROP PROCEDURE IF EXISTS call_RMRoot_Event;
DROP PROCEDURE IF EXISTS call_RMRoot_Event_Name;
DROP PROCEDURE IF EXISTS call_RMRoot_Event_RMCObject_Close;
DROP PROCEDURE IF EXISTS call_RMRoot_Event_RMCObject_Open;
DROP PROCEDURE IF EXISTS call_RMRoot_Event_RMPObject_Close;
DROP PROCEDURE IF EXISTS call_RMRoot_Event_RMPObject_Open;
DROP PROCEDURE IF EXISTS call_RMRoot_Event_RMTObject_Close;
DROP PROCEDURE IF EXISTS call_RMRoot_Event_RMTObject_Open;
DROP PROCEDURE IF EXISTS call_RMRoot_Log;
DROP PROCEDURE IF EXISTS call_RMRoot_Select;
DROP PROCEDURE IF EXISTS call_RMRoot_Validate;
DROP PROCEDURE IF EXISTS call_RMRoot_Validate_Name;
DROP PROCEDURE IF EXISTS call_RMRoot_Validate_Owner;
DROP PROCEDURE IF EXISTS get_RMRoot_Update;
DROP PROCEDURE IF EXISTS set_RMRoot_Name;
DROP PROCEDURE IF EXISTS set_RMRoot_Owner;
DROP PROCEDURE IF EXISTS set_RMRoot_RMCObject_Close;
DROP PROCEDURE IF EXISTS set_RMRoot_RMCObject_Open;
DROP PROCEDURE IF EXISTS set_RMRoot_RMPObject_Close;
DROP PROCEDURE IF EXISTS set_RMRoot_RMPObject_Open;
DROP PROCEDURE IF EXISTS set_RMRoot_RMTObject_Close;
DROP PROCEDURE IF EXISTS set_RMRoot_RMTObject_Open;
DROP PROCEDURE IF EXISTS call_RMTMatrix_Car;
DROP PROCEDURE IF EXISTS call_RMTMatrix_Cyl;
DROP PROCEDURE IF EXISTS call_RMTMatrix_Geo;
DROP PROCEDURE IF EXISTS call_RMTMatrix_Inverse;
DROP PROCEDURE IF EXISTS call_RMTMatrix_Mult;
DROP PROCEDURE IF EXISTS call_RMTMatrix_Nul;
DROP PROCEDURE IF EXISTS call_RMTMatrix_Relative;
DROP PROCEDURE IF EXISTS call_RMTMatrix_Rotate;
DROP PROCEDURE IF EXISTS call_RMTMatrix_Scale;
DROP PROCEDURE IF EXISTS call_RMTMatrix_Translate;
DROP PROCEDURE IF EXISTS call_RMTObject_Event;
DROP PROCEDURE IF EXISTS call_RMTObject_Event_Bound;
DROP PROCEDURE IF EXISTS call_RMTObject_Event_Name;
DROP PROCEDURE IF EXISTS call_RMTObject_Event_Owner;
DROP PROCEDURE IF EXISTS call_RMTObject_Event_Properties;
DROP PROCEDURE IF EXISTS call_RMTObject_Event_Resource;
DROP PROCEDURE IF EXISTS call_RMTObject_Event_RMPObject_Close;
DROP PROCEDURE IF EXISTS call_RMTObject_Event_RMPObject_Open;
DROP PROCEDURE IF EXISTS call_RMTObject_Event_RMTObject_Close;
DROP PROCEDURE IF EXISTS call_RMTObject_Event_RMTObject_Open;
DROP PROCEDURE IF EXISTS call_RMTObject_Event_Transform;
DROP PROCEDURE IF EXISTS call_RMTObject_Event_Type;
DROP PROCEDURE IF EXISTS call_RMTObject_Log;
DROP PROCEDURE IF EXISTS call_RMTObject_Select;
DROP PROCEDURE IF EXISTS call_RMTObject_Validate;
DROP PROCEDURE IF EXISTS call_RMTObject_Validate_Bound;
DROP PROCEDURE IF EXISTS call_RMTObject_Validate_Coord_Car;
DROP PROCEDURE IF EXISTS call_RMTObject_Validate_Coord_Cyl;
DROP PROCEDURE IF EXISTS call_RMTObject_Validate_Coord_Geo;
DROP PROCEDURE IF EXISTS call_RMTObject_Validate_Coord_Nul;
DROP PROCEDURE IF EXISTS call_RMTObject_Validate_Name;
DROP PROCEDURE IF EXISTS call_RMTObject_Validate_Owner;
DROP PROCEDURE IF EXISTS call_RMTObject_Validate_Properties;
DROP PROCEDURE IF EXISTS call_RMTObject_Validate_Resource;
DROP PROCEDURE IF EXISTS call_RMTObject_Validate_Transform;
DROP PROCEDURE IF EXISTS call_RMTObject_Validate_Type;
DROP PROCEDURE IF EXISTS get_RMTObject_Update;
DROP PROCEDURE IF EXISTS search_RMTObject;
DROP PROCEDURE IF EXISTS set_RMTObject_Bound;
DROP PROCEDURE IF EXISTS set_RMTObject_Name;
DROP PROCEDURE IF EXISTS set_RMTObject_Owner;
DROP PROCEDURE IF EXISTS set_RMTObject_Properties;
DROP PROCEDURE IF EXISTS set_RMTObject_Resource;
DROP PROCEDURE IF EXISTS set_RMTObject_RMPObject_Close;
DROP PROCEDURE IF EXISTS set_RMTObject_RMPObject_Open;
DROP PROCEDURE IF EXISTS set_RMTObject_RMTObject_Close;
DROP PROCEDURE IF EXISTS set_RMTObject_RMTObject_Open;
DROP PROCEDURE IF EXISTS set_RMTObject_Transform;
DROP PROCEDURE IF EXISTS set_RMTObject_Type;
/*
** Copyright 2025 Metaversal Corporation.
** 
** Licensed under the Apache License, Version 2.0 (the "License"), 
** you may not use this file except in compliance with the License. 
** You may obtain a copy of the License at 
** 
**    https://www.apache.org/licenses/LICENSE-2.0
** 
** Unless required by applicable law or agreed to in writing, software 
** distributed under the License is distributed on an "AS IS" BASIS, 
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
** See the License for the specific language governing permissions and 
** limitations under the License.
** 
** SPDX-License-Identifier: Apache-2.0
*/

/* ************************************************************************************************************************** */

/*
   For now, anyone in this table is considered an admin and can do all adminy stuff
*/

CREATE TABLE IF NOT EXISTS Admin
(
   twRPersonaIx                        BIGINT            NOT NULL,

   CONSTRAINT PK_Admin PRIMARY KEY
   (
      twRPersonaIx                     ASC
   )
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/* ************************************************************************************************************************** */
/*
** Copyright 2025 Metaversal Corporation.
** 
** Licensed under the Apache License, Version 2.0 (the "License"), 
** you may not use this file except in compliance with the License. 
** You may obtain a copy of the License at 
** 
**    https://www.apache.org/licenses/LICENSE-2.0
** 
** Unless required by applicable law or agreed to in writing, software 
** distributed under the License is distributed on an "AS IS" BASIS, 
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
** See the License for the specific language governing permissions and 
** limitations under the License.
** 
** SPDX-License-Identifier: Apache-2.0
*/

/* ************************************************************************************************************************** */

CREATE TABLE IF NOT EXISTS RMCType
(
   bType                               TINYINT UNSIGNED  NOT NULL,
   sType                               VARCHAR (31)      NOT NULL,

   CONSTRAINT PK_RMCType PRIMARY KEY
   (
      bType                            ASC
   )
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/* ************************************************************************************************************************** */

CREATE TABLE IF NOT EXISTS RMCObject
(
   ObjectHead_Parent_wClass            SMALLINT          NOT NULL,
   ObjectHead_Parent_twObjectIx        BIGINT            NOT NULL,
   ObjectHead_Self_wClass              SMALLINT          NOT NULL,
   ObjectHead_Self_twObjectIx          BIGINT            NOT NULL AUTO_INCREMENT,
   ObjectHead_twEventIz                BIGINT            NOT NULL,
   ObjectHead_wFlags                   SMALLINT          NOT NULL,

   Name_wsRMCObjectId                  VARCHAR (48)      NOT NULL,
   Type_bType                          TINYINT UNSIGNED  NOT NULL,
   Type_bSubtype                       TINYINT UNSIGNED  NOT NULL,
   Type_bFiction                       TINYINT UNSIGNED  NOT NULL,
   Owner_twRPersonaIx                  BIGINT            NOT NULL,
   Resource_qwResource                 BIGINT            NOT NULL,
   Resource_sName                      VARCHAR (48)      NOT NULL DEFAULT '',
   Resource_sReference                 VARCHAR (128)     NOT NULL DEFAULT '',
   Transform_Position_dX               DOUBLE            NOT NULL,
   Transform_Position_dY               DOUBLE            NOT NULL,
   Transform_Position_dZ               DOUBLE            NOT NULL,
   Transform_Rotation_dX               DOUBLE            NOT NULL,
   Transform_Rotation_dY               DOUBLE            NOT NULL,
   Transform_Rotation_dZ               DOUBLE            NOT NULL,
   Transform_Rotation_dW               DOUBLE            NOT NULL,
   Transform_Scale_dX                  DOUBLE            NOT NULL,
   Transform_Scale_dY                  DOUBLE            NOT NULL,
   Transform_Scale_dZ                  DOUBLE            NOT NULL,
   Orbit_Spin_tmPeriod                 BIGINT            NOT NULL,
   Orbit_Spin_tmStart                  BIGINT            NOT NULL,
   Orbit_Spin_dA                       DOUBLE            NOT NULL,
   Orbit_Spin_dB                       DOUBLE            NOT NULL,
   Bound_dX                            DOUBLE            NOT NULL,
   Bound_dY                            DOUBLE            NOT NULL,
   Bound_dZ                            DOUBLE            NOT NULL,
   Properties_fMass                    FLOAT             NOT NULL,                        
   Properties_fGravity                 FLOAT             NOT NULL,                        
   Properties_fColor                   FLOAT             NOT NULL,                        
   Properties_fBrightness              FLOAT             NOT NULL,                        
   Properties_fReflectivity            FLOAT             NOT NULL,                        

   CONSTRAINT PK_RMCObject PRIMARY KEY
   (
      ObjectHead_Self_twObjectIx       ASC
   ),

   INDEX IX_RMCObject_ObjectHead_Parent_twObjectIx
   (
      ObjectHead_Parent_twObjectIx     ASC
   ),

   INDEX IX_RMCObject_Name_wsRMCObjectId
   (
      Name_wsRMCObjectId               ASC
   )
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/* ************************************************************************************************************************** */

-- bOp     Meaning
-- 0       NULL
-- 1       RMCObject_Open
-- 2       RMCObject_Close
-- 3       RMCObject_Name
-- 4       RMCObject_Type
-- 5       RMCObject_Owner
-- 6       RMCObject_Resource
-- 7       RMCObject_Transform
-- 8       RMCObject_Orbit
-- 9       RMCObject_Spin
-- 10      RMCObject_Bound
-- 11      RMCObject_Properties

CREATE TABLE IF NOT EXISTS RMCObjectLog
(
   dtCreated                           DATETIME          NOT NULL    DEFAULT CURRENT_TIMESTAMP,
   twLogIx                             BIGINT            NOT NULL    AUTO_INCREMENT,

   bOp                                 TINYINT UNSIGNED  NOT NULL,
   dwIPAddress                         BINARY(4)         NOT NULL,
   twRPersonaIx                        BIGINT            NOT NULL,
   twRMCObjectIx                       BIGINT            NOT NULL,

   CONSTRAINT PK_RMCObjectLog PRIMARY KEY
   (
      twLogIx                          ASC
   )
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/* ************************************************************************************************************************** */
/*
** Copyright 2025 Metaversal Corporation.
** 
** Licensed under the Apache License, Version 2.0 (the "License"), 
** you may not use this file except in compliance with the License. 
** You may obtain a copy of the License at 
** 
**    https://www.apache.org/licenses/LICENSE-2.0
** 
** Unless required by applicable law or agreed to in writing, software 
** distributed under the License is distributed on an "AS IS" BASIS, 
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
** See the License for the specific language governing permissions and 
** limitations under the License.
** 
** SPDX-License-Identifier: Apache-2.0
*/

/* ************************************************************************************************************************** */

CREATE TABLE IF NOT EXISTS RMEvent
(
   twEventIx                           BIGINT            NOT NULL AUTO_INCREMENT,

   sType                               VARCHAR (32)      NOT NULL,

   Self_wClass                         TINYINT UNSIGNED  NOT NULL,
   Self_twObjectIx                     BIGINT            NOT NULL,
   Child_wClass                        TINYINT UNSIGNED  NOT NULL,
   Child_twObjectIx                    BIGINT            NOT NULL,
   wFlags                              SMALLINT          NOT NULL,
   twEventIz                           BIGINT            NOT NULL,
   
   sJSON_Object                        TEXT              NOT NULL,
   sJSON_Child                         TEXT              NOT NULL,
   sJSON_Change                        TEXT              NOT NULL,

   CONSTRAINT PK_RMEvent PRIMARY KEY
   (
      twEventIx                        ASC
   )
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/* ************************************************************************************************************************** */
/*
** Copyright 2025 Metaversal Corporation.
** 
** Licensed under the Apache License, Version 2.0 (the "License"), 
** you may not use this file except in compliance with the License. 
** You may obtain a copy of the License at 
** 
**    https://www.apache.org/licenses/LICENSE-2.0
** 
** Unless required by applicable law or agreed to in writing, software 
** distributed under the License is distributed on an "AS IS" BASIS, 
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
** See the License for the specific language governing permissions and 
** limitations under the License.
** 
** SPDX-License-Identifier: Apache-2.0
*/

/* ************************************************************************************************************************** */

CREATE TABLE IF NOT EXISTS RMPType
(
   bType                               TINYINT UNSIGNED  NOT NULL,
   sType                               VARCHAR (31)      NOT NULL,

   CONSTRAINT PK_RMPType PRIMARY KEY
   (
      bType ASC
   )
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/* ************************************************************************************************************************** */

CREATE TABLE IF NOT EXISTS RMPObject
(
   ObjectHead_Parent_wClass            SMALLINT          NOT NULL,
   ObjectHead_Parent_twObjectIx        BIGINT            NOT NULL,
   ObjectHead_Self_wClass              SMALLINT          NOT NULL,
   ObjectHead_Self_twObjectIx          BIGINT            NOT NULL AUTO_INCREMENT,
   ObjectHead_twEventIz                BIGINT            NOT NULL,
   ObjectHead_wFlags                   SMALLINT          NOT NULL,

   Name_wsRMPObjectId                  VARCHAR (48)      NOT NULL DEFAULT '',
   Type_bType                          TINYINT UNSIGNED  NOT NULL,
   Type_bSubtype                       TINYINT UNSIGNED  NOT NULL,
   Type_bFiction                       TINYINT UNSIGNED  NOT NULL,
   Type_bMovable                       TINYINT UNSIGNED  NOT NULL,
   Owner_twRPersonaIx                  BIGINT            NOT NULL,
   Resource_qwResource                 BIGINT            NOT NULL,
   Resource_sName                      VARCHAR (48)      NOT NULL DEFAULT '',
   Resource_sReference                 VARCHAR (128)     NOT NULL DEFAULT '',
   Transform_Position_dX               DOUBLE            NOT NULL,
   Transform_Position_dY               DOUBLE            NOT NULL,
   Transform_Position_dZ               DOUBLE            NOT NULL,
   Transform_Rotation_dX               DOUBLE            NOT NULL,
   Transform_Rotation_dY               DOUBLE            NOT NULL,
   Transform_Rotation_dZ               DOUBLE            NOT NULL,
   Transform_Rotation_dW               DOUBLE            NOT NULL,
   Transform_Scale_dX                  DOUBLE            NOT NULL,
   Transform_Scale_dY                  DOUBLE            NOT NULL,
   Transform_Scale_dZ                  DOUBLE            NOT NULL,
   Bound_dX                            DOUBLE            NOT NULL,
   Bound_dY                            DOUBLE            NOT NULL,
   Bound_dZ                            DOUBLE            NOT NULL,

   CONSTRAINT PK_RMPObject PRIMARY KEY
   (
      ObjectHead_Self_twObjectIx       ASC
   ),

   INDEX IX_RMPObject_ObjectHead_Parent_twObjectIx
   (
      ObjectHead_Parent_twObjectIx     ASC
   )
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/* ************************************************************************************************************************** */

-- bOp     Meaning
-- 0       NULL
-- 1       RMPObject_Open
-- 2       RMPObject_Close
-- 3    -- RMPObject_Name
-- 4       RMPObject_Type
-- 5       RMPObject_Owner
-- 6       RMPObject_Resource
-- 7       RMPObject_Transform
-- 8    -- RMPObject_Orbit
-- 9    -- RMPObject_Spin
-- 10      RMPObject_Bound
-- 11   -- RMPObject_Properties

CREATE TABLE IF NOT EXISTS RMPObjectLog
(
   dtCreated                           DATETIME          NOT NULL    DEFAULT CURRENT_TIMESTAMP,
   twLogIx                             BIGINT            NOT NULL    AUTO_INCREMENT,
                                                         
   bOp                                 TINYINT UNSIGNED  NOT NULL,
   dwIPAddress                         BINARY(4)         NOT NULL,
   twRPersonaIx                        BIGINT            NOT NULL,
   twRMPObjectIx                       BIGINT            NOT NULL,

   CONSTRAINT PK_RMPObjectLog PRIMARY KEY
   (
      twLogIx                          ASC
   )
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/* ************************************************************************************************************************** */
/*
** Copyright 2025 Metaversal Corporation.
** 
** Licensed under the Apache License, Version 2.0 (the "License"), 
** you may not use this file except in compliance with the License. 
** You may obtain a copy of the License at 
** 
**    https://www.apache.org/licenses/LICENSE-2.0
** 
** Unless required by applicable law or agreed to in writing, software 
** distributed under the License is distributed on an "AS IS" BASIS, 
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
** See the License for the specific language governing permissions and 
** limitations under the License.
** 
** SPDX-License-Identifier: Apache-2.0
*/

/* ************************************************************************************************************************** */

CREATE TABLE IF NOT EXISTS RMRoot
(
   ObjectHead_Parent_wClass            SMALLINT          NOT NULL,
   ObjectHead_Parent_twObjectIx        BIGINT            NOT NULL,
   ObjectHead_Self_wClass              SMALLINT          NOT NULL,
   ObjectHead_Self_twObjectIx          BIGINT            NOT NULL AUTO_INCREMENT,
   ObjectHead_twEventIz                BIGINT            NOT NULL,
   ObjectHead_wFlags                   SMALLINT          NOT NULL,

   Name_wsRMRootId                     VARCHAR (48)      NOT NULL,
   Owner_twRPersonaIx                  BIGINT            NOT NULL,

   CONSTRAINT PK_RMRoot PRIMARY KEY
   (
      ObjectHead_Self_twObjectIx       ASC
   )
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/* ************************************************************************************************************************** */

-- bOp     Meaning
-- 0       NULL
-- 1    -- RMRoot_Open
-- 2    -- RMRoot_Close
-- 3       RMRoot_Name
-- 4    -- RMRoot_Type
-- 5       RMRoot_Owner
-- 6    -- RMRoot_Resource
-- 7    -- RMRoot_Transform
-- 8    -- RMRoot_Orbit
-- 9    -- RMRoot_Spin
-- 10   -- RMRoot_Bound
-- 11   -- RMRoot_Properties
-- 12   -- RMRoot_RMRoot_Open
-- 13   -- RMRoot_RMRoot_Close
-- 14      RMRoot_RMCObject_Open
-- 15      RMRoot_RMCObject_Close
-- 16      RMRoot_RMTObject_Open
-- 17      RMRoot_RMTObject_Close
-- 18      RMRoot_RMPObject_Open
-- 19      RMRoot_RMPObject_Close

CREATE TABLE IF NOT EXISTS RMRootLog
(
   dtCreated                           DATETIME          NOT NULL    DEFAULT CURRENT_TIMESTAMP,
   twLogIx                             BIGINT            NOT NULL    AUTO_INCREMENT,
                                                         
   bOp                                 TINYINT UNSIGNED  NOT NULL,
   dwIPAddress                         BINARY(4)         NOT NULL,
   twRPersonaIx                        BIGINT            NOT NULL,
   twRMRootIx                          BIGINT            NOT NULL,

   CONSTRAINT PK_RMRootLog PRIMARY KEY
   (
      twLogIx                          ASC
   )
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/* ************************************************************************************************************************** */
/*
** Copyright 2025 Metaversal Corporation.
** 
** Licensed under the Apache License, Version 2.0 (the "License"), 
** you may not use this file except in compliance with the License. 
** You may obtain a copy of the License at 
** 
**    https://www.apache.org/licenses/LICENSE-2.0
** 
** Unless required by applicable law or agreed to in writing, software 
** distributed under the License is distributed on an "AS IS" BASIS, 
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
** See the License for the specific language governing permissions and 
** limitations under the License.
** 
** SPDX-License-Identifier: Apache-2.0
*/

/* ************************************************************************************************************************** */

CREATE TABLE IF NOT EXISTS RMTSubsurface
(
   twRMTObjectIx                       BIGINT            NOT NULL,
                                                                 --                        Nul      Car      Cyl      Geo
   tnGeometry                          TINYINT UNSIGNED  NOT NULL, --                        0        1        2        3
   dA                                  DOUBLE            NOT NULL,      -- original coordinates   -        x        angle    latitude
   dB                                  DOUBLE            NOT NULL,      -- original coordinates   -        y        y        longitude
   dC                                  DOUBLE            NOT NULL,      -- original coordinates   -        z        radius   radius

-- bnMatrix =  twRMTObjectIx is the         transform for this subsurface
-- bnMatrix = -twRMTObjectIx is the inverse transform for this subsurface

   PRIMARY KEY
   (
      twRMTObjectIx                    ASC
   )
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS RMTMatrix
(
   bnMatrix                            BIGINT            NOT NULL,

   d00                                 DOUBLE            NOT NULL DEFAULT 1,
   d01                                 DOUBLE            NOT NULL DEFAULT 0,
   d02                                 DOUBLE            NOT NULL DEFAULT 0,
   d03                                 DOUBLE            NOT NULL DEFAULT 0,

   d10                                 DOUBLE            NOT NULL DEFAULT 0,
   d11                                 DOUBLE            NOT NULL DEFAULT 1,
   d12                                 DOUBLE            NOT NULL DEFAULT 0,
   d13                                 DOUBLE            NOT NULL DEFAULT 0,

   d20                                 DOUBLE            NOT NULL DEFAULT 0,
   d21                                 DOUBLE            NOT NULL DEFAULT 0,
   d22                                 DOUBLE            NOT NULL DEFAULT 1,
   d23                                 DOUBLE            NOT NULL DEFAULT 0,

   d30                                 DOUBLE            NOT NULL DEFAULT 0,
   d31                                 DOUBLE            NOT NULL DEFAULT 0,
   d32                                 DOUBLE            NOT NULL DEFAULT 0,
   d33                                 DOUBLE            NOT NULL DEFAULT 1,

   PRIMARY KEY
   (
      bnMatrix                         ASC
   )
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/* ************************************************************************************************************************** */
/*
** Copyright 2025 Metaversal Corporation.
** 
** Licensed under the Apache License, Version 2.0 (the "License"), 
** you may not use this file except in compliance with the License. 
** You may obtain a copy of the License at 
** 
**    https://www.apache.org/licenses/LICENSE-2.0
** 
** Unless required by applicable law or agreed to in writing, software 
** distributed under the License is distributed on an "AS IS" BASIS, 
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
** See the License for the specific language governing permissions and 
** limitations under the License.
** 
** SPDX-License-Identifier: Apache-2.0
*/

/* ************************************************************************************************************************** */

CREATE TABLE IF NOT EXISTS RMTType
(
   bType                               TINYINT UNSIGNED  NOT NULL,
   sType                               VARCHAR (31)      NOT NULL,

   CONSTRAINT PK_RMTType PRIMARY KEY
   (
      bType ASC
   )
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/* ************************************************************************************************************************** */

CREATE TABLE IF NOT EXISTS RMTObject
(
   ObjectHead_Parent_wClass            SMALLINT          NOT NULL,
   ObjectHead_Parent_twObjectIx        BIGINT            NOT NULL,
   ObjectHead_Self_wClass              SMALLINT          NOT NULL,
   ObjectHead_Self_twObjectIx          BIGINT            NOT NULL AUTO_INCREMENT,
   ObjectHead_twEventIz                BIGINT            NOT NULL,
   ObjectHead_wFlags                   SMALLINT          NOT NULL,

   Name_wsRMTObjectId                  VARCHAR (48)      NOT NULL,
   Type_bType                          TINYINT UNSIGNED  NOT NULL,
   Type_bSubtype                       TINYINT UNSIGNED  NOT NULL,
   Type_bFiction                       TINYINT UNSIGNED  NOT NULL,
   Owner_twRPersonaIx                  BIGINT            NOT NULL,
   Resource_qwResource                 BIGINT            NOT NULL,
   Resource_sName                      VARCHAR (48)      NOT NULL DEFAULT '',
   Resource_sReference                 VARCHAR (128)     NOT NULL DEFAULT '',
   Transform_Position_dX               DOUBLE            NOT NULL,
   Transform_Position_dY               DOUBLE            NOT NULL,
   Transform_Position_dZ               DOUBLE            NOT NULL,
   Transform_Rotation_dX               DOUBLE            NOT NULL,
   Transform_Rotation_dY               DOUBLE            NOT NULL,
   Transform_Rotation_dZ               DOUBLE            NOT NULL,
   Transform_Rotation_dW               DOUBLE            NOT NULL,
   Transform_Scale_dX                  DOUBLE            NOT NULL,
   Transform_Scale_dY                  DOUBLE            NOT NULL,
   Transform_Scale_dZ                  DOUBLE            NOT NULL,
   Bound_dX                            DOUBLE            NOT NULL,
   Bound_dY                            DOUBLE            NOT NULL,
   Bound_dZ                            DOUBLE            NOT NULL,
   Properties_bLockToGround            TINYINT UNSIGNED  NOT NULL,
   Properties_bYouth                   TINYINT UNSIGNED  NOT NULL,
   Properties_bAdult                   TINYINT UNSIGNED  NOT NULL,
   Properties_bAvatar                  TINYINT UNSIGNED  NOT NULL,

   CONSTRAINT PK_RMTObject PRIMARY KEY
   (
      ObjectHead_Self_twObjectIx       ASC
   ),

   INDEX IX_RMTObject_ObjectHead_Parent_twObjectIx
   (
      ObjectHead_Parent_twObjectIx     ASC
   ),

   INDEX IX_RMTObject_Name_wsRMTObjectId
   (
      Name_wsRMTObjectId               ASC
   )
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/* ************************************************************************************************************************** */

-- bOp     Meaning
-- 0       NULL
-- 1       RMTObject_Open
-- 2       RMTObject_Close
-- 3       RMTObject_Name
-- 4       RMTObject_Type
-- 5       RMTObject_Owner
-- 6       RMTObject_Resource
-- 7       RMTObject_Transform
-- 8    -- RMTObject_Orbit
-- 9    -- RMTObject_Spin
-- 10      RMTObject_Bound
-- 11      RMTObject_Properties

CREATE TABLE IF NOT EXISTS RMTObjectLog
(
   dtCreated                           DATETIME          NOT NULL    DEFAULT CURRENT_TIMESTAMP,
   twLogIx                             BIGINT            NOT NULL    AUTO_INCREMENT,
                                                         
   bOp                                 TINYINT UNSIGNED  NOT NULL,
   dwIPAddress                         BINARY(4)         NOT NULL,
   twRPersonaIx                        BIGINT            NOT NULL,
   twRMTObjectIx                       BIGINT            NOT NULL,

   CONSTRAINT PK_RMTObjectLog PRIMARY KEY
   (
      twLogIx                          ASC
   )
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/* ************************************************************************************************************************** */
/*
** Copyright 2025 Metaversal Corporation.
** 
** Licensed under the Apache License, Version 2.0 (the "License"), 
** you may not use this file except in compliance with the License. 
** You may obtain a copy of the License at 
** 
**    https://www.apache.org/licenses/LICENSE-2.0
** 
** Unless required by applicable law or agreed to in writing, software 
** distributed under the License is distributed on an "AS IS" BASIS, 
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
** See the License for the specific language governing permissions and 
** limitations under the License.
** 
** SPDX-License-Identifier: Apache-2.0
*/

/* ************************************************************************************************************************** */

/*
   Version history of database updates
*/

CREATE TABLE IF NOT EXISTS Version
(
   dtStamp                             DATETIME          NOT NULL DEFAULT CURRENT_TIMESTAMP,
   nVersion                            INT               NOT NULL,
   sDescription                        VARCHAR (255)     NOT NULL,

   CONSTRAINT PK_Version PRIMARY KEY
   (
      nVersion                         ASC
   )
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

