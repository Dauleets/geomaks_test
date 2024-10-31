
// class BaseWrapper extends StatefulWidget {
//   final Widget child;
//   const BaseWrapper({super.key, required this.child});

//   @override
//   _BaseWrapperState createState() => _BaseWrapperState();
// }

// class _BaseWrapperState extends State<BaseWrapper> {
//   final NotificationCountNotifier _countNotifier = NotificationCountNotifier();

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<NotificationCountCubit, NotificationCountState>(
//       listener: (context, state) {
//         state.whenOrNull(
//           loadedState: (notificationCount) {
//             _countNotifier.value = notificationCount;
//           },
//         );
//       },
//       child: NotificationsScope(
//         countNotifier: _countNotifier,
//         child: widget.child,
//       ),
//     );
//   }
// }
