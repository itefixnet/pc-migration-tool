# PC Migration Tool: Simplifying PC Transitions

## Overview

The PC Migration Tool (`pc_migration_tool.exe`) is a user-friendly Windows application designed to streamline the process of backing up important files when transitioning from an old PC to a new one. Built using NSIS (Nullsoft Scriptable Install System), this tool provides a guided wizard interface to help users safely copy their critical documents to a USB drive.

**Note:** NSIS is required to compile the project from source.

## The Problem It Solves

When employees or users need to switch to a new computer, one of the most critical and often stressful tasks is ensuring that no important files are left behind. Manually searching through folders, identifying important documents, and copying them can be time-consuming and error-prone. Users often worry about forgetting crucial files or accidentally skipping important directories.

## How It Works

The PC Migration Tool automates this process with a simple, three-step wizard:

1. **USB Detection**: The tool automatically detects connected USB drives, prompting the user to insert one if none is found
2. **Automated Backup**: Once started, it scans the entire C: drive for common document types
3. **Safe Copy**: Files are copied to a `Backup` folder on the USB drive, preserving their directory structure

## Supported File Types

The tool intelligently searches for and backs up the following file types:

- **Microsoft Office Documents**: Word (.doc, .docx), Excel (.xls, .xlsx), PowerPoint (.ppt, .pptx)
- **Microsoft Visio**: Diagrams and drawings (.vsd, .vsdx)
- **PDF Files**: All PDF documents (.pdf)
- **Outlook Data**: Personal folder files (.pst)

## Key Features

### User-Friendly Interface
The wizard presents clear instructions, making it accessible even for non-technical users. The interface includes:
- A welcoming start screen
- Progress indication during file copy
- Confirmation when the backup is complete

### Comprehensive Search
The tool recursively searches all subdirectories on the C: drive, ensuring that files aren't missed regardless of where they're stored.

### Safe Operation
Files are copied (not moved), so the originals remain intact on the source computer. The tool uses Windows' `xcopy` command with flags that continue copying even if errors occur, maximizing the number of files successfully backed up.

## Use Cases

This tool is ideal for:
- Corporate IT departments managing PC refresh cycles
- Organizations helping employees migrate to new computers
- Small businesses without dedicated IT staff
- Educational institutions managing student or faculty computer transitions

---

*Note: This tool is specifically designed for Windows environments and requires a USB drive with sufficient storage space to accommodate the files being backed up.*
