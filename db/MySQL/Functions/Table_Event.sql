/*
** Copyright 2025 Metaversal Corporation.
** 
** Licensed under the Apache License, Version 2.0 (the "License"); 
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

-- Note: MySQL doesn't support table-valued functions like SQL Server
-- This would need to be implemented as a stored procedure that creates a temporary table
-- For now, this is converted to a comment indicating the table structure

-- CREATE TEMPORARY TABLE Event
-- (
--    nOrder                        INT             NOT NULL AUTO_INCREMENT PRIMARY KEY,
--    sType                         VARCHAR (32)    NOT NULL,
--    Self_wClass                   SMALLINT        NOT NULL,
--    Self_twObjectIx               BIGINT          NOT NULL,
--    Child_wClass                  SMALLINT        NOT NULL,
--    Child_twObjectIx              BIGINT          NOT NULL,
--    wFlags                        SMALLINT        NOT NULL,
--    twEventIz                     BIGINT          NOT NULL,
--    sJSON_Object                  TEXT            NOT NULL,
--    sJSON_Child                   TEXT            NOT NULL,
--    sJSON_Change                  TEXT            NOT NULL
-- );

/* ************************************************************************************************************************** */
