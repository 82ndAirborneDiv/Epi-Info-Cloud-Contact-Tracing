﻿namespace Epi.Windows.ImportExport.Dialogs
{
    partial class PackageGridRemovalDialog
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.lblFields = new System.Windows.Forms.Label();
            this.lbxGridColumns = new System.Windows.Forms.ListBox();
            this.lblForm = new System.Windows.Forms.Label();
            this.cmbGridSelector = new System.Windows.Forms.ComboBox();
            this.btnOK = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // lblFields
            // 
            this.lblFields.Location = new System.Drawing.Point(12, 104);
            this.lblFields.Name = "lblFields";
            this.lblFields.Size = new System.Drawing.Size(283, 14);
            this.lblFields.TabIndex = 23;
            this.lblFields.Text = "Select grid columns to remove from the selected grid:";
            // 
            // lbxGridColumns
            // 
            this.lbxGridColumns.FormattingEnabled = true;
            this.lbxGridColumns.Location = new System.Drawing.Point(12, 121);
            this.lbxGridColumns.Name = "lbxGridColumns";
            this.lbxGridColumns.SelectionMode = System.Windows.Forms.SelectionMode.MultiExtended;
            this.lbxGridColumns.Size = new System.Drawing.Size(283, 160);
            this.lbxGridColumns.TabIndex = 24;
            this.lbxGridColumns.SelectedIndexChanged += new System.EventHandler(this.lbxFields_SelectedIndexChanged);
            // 
            // lblForm
            // 
            this.lblForm.Location = new System.Drawing.Point(12, 63);
            this.lblForm.Name = "lblForm";
            this.lblForm.Size = new System.Drawing.Size(283, 14);
            this.lblForm.TabIndex = 22;
            this.lblForm.Text = "Select a grid on which to remove data:";
            // 
            // cmbGridSelector
            // 
            this.cmbGridSelector.FormattingEnabled = true;
            this.cmbGridSelector.Location = new System.Drawing.Point(12, 80);
            this.cmbGridSelector.Name = "cmbGridSelector";
            this.cmbGridSelector.Size = new System.Drawing.Size(283, 21);
            this.cmbGridSelector.TabIndex = 21;
            this.cmbGridSelector.SelectedIndexChanged += new System.EventHandler(this.cmbFormSelector_SelectedIndexChanged);
            // 
            // btnOK
            // 
            this.btnOK.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnOK.DialogResult = System.Windows.Forms.DialogResult.OK;
            this.btnOK.Location = new System.Drawing.Point(139, 296);
            this.btnOK.Name = "btnOK";
            this.btnOK.Size = new System.Drawing.Size(75, 23);
            this.btnOK.TabIndex = 25;
            this.btnOK.Text = "OK";
            this.btnOK.UseVisualStyleBackColor = true;
            // 
            // btnCancel
            // 
            this.btnCancel.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnCancel.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnCancel.Location = new System.Drawing.Point(220, 296);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(75, 23);
            this.btnCancel.TabIndex = 26;
            this.btnCancel.Text = "Cancel";
            this.btnCancel.UseVisualStyleBackColor = true;
            // 
            // label1
            // 
            this.label1.Location = new System.Drawing.Point(9, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(284, 41);
            this.label1.TabIndex = 27;
            this.label1.Text = "Use this dialog to remove data from columns in the selected grid.";
            // 
            // PackageGridRemovalDialog
            // 
            this.AcceptButton = this.btnOK;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(307, 331);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnOK);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.lblFields);
            this.Controls.Add(this.lbxGridColumns);
            this.Controls.Add(this.lblForm);
            this.Controls.Add(this.cmbGridSelector);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "PackageGridRemovalDialog";
            this.ShowIcon = false;
            this.Text = "Remove Columns from Data Package";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label lblFields;
        private System.Windows.Forms.ListBox lbxGridColumns;
        private System.Windows.Forms.Label lblForm;
        private System.Windows.Forms.ComboBox cmbGridSelector;
        private System.Windows.Forms.Button btnOK;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Label label1;
    }
}