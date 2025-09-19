import 'package:flutter/material.dart';
import 'package:awesome_ui/awesome_ui.dart';

class FeedbackShowcaseScreen extends StatefulWidget {
  const FeedbackShowcaseScreen({super.key});

  @override
  State<FeedbackShowcaseScreen> createState() => _FeedbackShowcaseScreenState();
}

class _FeedbackShowcaseScreenState extends State<FeedbackShowcaseScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuiText(
            'Feedback Showcase',
            variant: AuiTextVariant.headlineLarge,
          ),
          const SizedBox(height: 24),
          
          // Dialogs Section
          _buildDialogsSection(),
          
          const SizedBox(height: 32),
          
          // Bottom Sheets Section
          _buildBottomSheetsSection(),
          
          const SizedBox(height: 32),
          
          // Snackbars Section
          _buildSnackbarsSection(),
        ],
      ),
    );
  }

  Widget _buildDialogsSection() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Dialogs',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            
            // Basic Dialog
            const AuiText('Basic Dialog', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AuiButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const AuiText('Basic Dialog'),
                        content: const AuiText('This is a basic dialog with title and content.'),
                        actions: [
                          AuiButton(
                            onPressed: () => Navigator.of(context).pop(),
                            variant: AuiButtonVariant.outline,
                            child: const AuiText('Cancel'),
                          ),
                          AuiButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const AuiText('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const AuiText('Basic Dialog'),
                ),
                
                // Alert Dialog
                AuiButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const AuiText('Alert'),
                        content: const AuiText('This is an alert dialog.'),
                        actions: [
                          AuiButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const AuiText('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const AuiText('Alert Dialog'),
                ),
                
                // Confirmation Dialog
                AuiButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const AuiText('Confirm Action'),
                        content: const AuiText('Are you sure you want to perform this action?'),
                        actions: [
                          AuiButton(
                            onPressed: () => Navigator.of(context).pop(),
                            variant: AuiButtonVariant.outline,
                            child: const AuiText('Cancel'),
                          ),
                          AuiButton(
                            onPressed: () => Navigator.of(context).pop(),
                            emphasis: AuiButtonEmphasis.danger,
                            child: const AuiText('Delete'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const AuiText('Confirmation'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSheetsSection() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Bottom Sheets',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            
            // Basic Bottom Sheet
            const AuiText('Basic Bottom Sheet', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AuiButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const AuiText('Basic Bottom Sheet'),
                            const SizedBox(height: 16),
                            const AuiText('This is a basic bottom sheet.'),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                AuiButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  variant: AuiButtonVariant.outline,
                                  child: const AuiText('Cancel'),
                                ),
                                const SizedBox(width: 8),
                                AuiButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const AuiText('OK'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: const AuiText('Basic Sheet'),
                ),
                
                // List Bottom Sheet
                AuiButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const AuiText('Options'),
                            const SizedBox(height: 16),
                            AuiListTile(
                              leading: const AuiIcon(Icons.edit),
                              title: const AuiText('Edit'),
                              onTap: () {
                                Navigator.of(context).pop();
                                // Handle edit
                              },
                            ),
                            AuiListTile(
                              leading: const AuiIcon(Icons.copy),
                              title: const AuiText('Copy'),
                              onTap: () {
                                Navigator.of(context).pop();
                                // Handle copy
                              },
                            ),
                            AuiListTile(
                              leading: const AuiIcon(Icons.share),
                              title: const AuiText('Share'),
                              onTap: () {
                                Navigator.of(context).pop();
                                // Handle share
                              },
                            ),
                            AuiListTile(
                              leading: const AuiIcon(Icons.delete),
                              title: const AuiText('Delete'),
                              onTap: () {
                                Navigator.of(context).pop();
                                // Handle delete
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: const AuiText('List Sheet'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSnackbarsSection() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Snackbars',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            
            // Basic Snackbar
            const AuiText('Basic Snackbar', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AuiButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: AuiText('This is a basic snackbar message'),
                      ),
                    );
                  },
                  child: const AuiText('Basic'),
                ),
                
                // Success Snackbar
                AuiButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const AuiText('Operation completed successfully!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  child: const AuiText('Success'),
                ),
                
                // Error Snackbar
                AuiButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const AuiText('An error occurred. Please try again.'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
                  child: const AuiText('Error'),
                ),
                
                // Warning Snackbar
                AuiButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const AuiText('Warning: This action cannot be undone.'),
                        backgroundColor: Colors.orange,
                      ),
                    );
                  },
                  child: const AuiText('Warning'),
                ),
                
                // Info Snackbar
                AuiButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const AuiText('Information: New features are available.'),
                        backgroundColor: Colors.blue,
                      ),
                    );
                  },
                  child: const AuiText('Info'),
                ),
                
                // Snackbar with Action
                AuiButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const AuiText('File deleted successfully'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            // Handle undo
                          },
                        ),
                      ),
                    );
                  },
                  child: const AuiText('With Action'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}